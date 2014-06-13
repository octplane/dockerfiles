#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
cd /home/rails
export RAILS_ENV=production
exec /sbin/setuser rails ./bin/rails server -p 3000

