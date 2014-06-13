FROM ubuntu
MAINTAINER Pierre Baillet <pierre@baillet.name>

# Install deps
RUN apt-get update && apt-get install -y python-software-properties git curl wget
RUN apt-get install -y build-essential subversion autoconf libpq-dev libsqlite3-dev libmysqlclient-dev zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

# Common
ENV HOME /home/apps
RUN mkdir -p $HOME

# Install rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git      $HOME/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
RUN $HOME/.rbenv/plugins/ruby-build/install.sh
ENV PATH $HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
ENV RBENV_ROOT $HOME/.rbenv
RUN echo 'PATH=/home/apps/.rbenv/bin:/home/apps/.rbenv/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc

# Install multiple versions of ruby
ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install 2.0.0-p481 && rbenv global 2.0.0-p481
RUN rbenv rehash

# Install Bundler for each version of ruby
RUN echo 'gem: --no-rdoc --no-ri' >> /$HOME/.gemrc
RUN gem install bundler
RUN rbenv rehash

RUN adduser --disabled-password --home=/home/apps --gecos "" apps
