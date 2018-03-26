FROM octplane/basebox:latest
MAINTAINER Pierre Baillet <pierre@baillet.name>

# Install deps
RUN apt-get install -y wget git build-essential autoconf libpq-dev zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

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
RUN rbenv install 2.2.2 && rbenv global 2.2.2
RUN rbenv rehash

# Install Bundler for each version of ruby
RUN echo 'gem: --no-rdoc --no-ri' >> /$HOME/.gemrc
RUN gem install bundler
RUN rbenv rehash


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
