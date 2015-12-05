set :application, 'ft2db_staging'
set :rails_env, 'staging'
set :deploy_to, '/home/seo/apps/ft2db_staging'

server '188.166.6.221', user: 'seo', roles: %w(web app db), port: 2395
