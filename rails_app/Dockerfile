FROM octplane/rbenv


ADD . /home/apps
RUN chown -R apps:apps /home/apps
WORKDIR /home/apps

ENV RAILS_ENV production

RUN su - apps -c 'bundle config path "$HOME/bundler"'
RUN su - apps -c 'bundle install'
RUN su - apps -c './bin/rake db:migrate'

EXPOSE 3000
USER apps

CMD ./bin/rails server -p 3000