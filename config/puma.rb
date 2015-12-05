if ENV['RAILS_ENV'] == 'production'
  directory '/home/seo/apps/ft2db/current'
  workers 4
elsif ENV['RAILS_ENV'] == 'staging'
  directory '/home/seo/apps/ft2db_staging/current'
  workers 1
end

environment ENV['RAILS_ENV'] || 'development'

bind 'unix://tmp/sockets/puma.sock'

prune_bundler
