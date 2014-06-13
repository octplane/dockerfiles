FROM octplane/rbenv


ADD . /home/apps
RUN chown -R apps:apps /home/apps
WORKDIR /home/apps

ENV RAILS_ENV production

RUN su - apps -c 'bundle config path "$HOME/bundler"'
RUN su - apps -c 'bundle install'
RUN su - apps -c './bin/rake db:migrate'

EXPOSE 3000
EXPOSE 22
### In Dockerfile:
RUN mkdir /etc/service/rails
ADD rails.sh /etc/service/rails/run
RUN chmod +x /etc/service/rails/run