FROM debian:12.5

LABEL maintainer="felix.cuello@gmail.com"
LABEL description="Just a ruby sandbox to avoid polluting my system"

# packages installation ----------------------------------------------------------------------------
RUN apt update -y && \
    apt install -y git curl libssl-dev libreadline-dev zlib1g-dev \
                   autoconf bison build-essential libyaml-dev libncurses5-dev \
                   libffi-dev libgdbm-dev vim git curl

# rbenv installation ------------------------------------------------------------------------------
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv \
    && git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build \
    && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(rbenv init -)"' >> ~/.bashrc


ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH
RUN    rbenv install 2.7.8 \
    && rbenv install 3.2.3 \
    && rbenv global 3.2.3 \
    && rbenv rehash

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
