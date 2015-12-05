set :application, 'ft2db'
set :rails_env, 'production'
set :deploy_to, '/home/seo/apps/ft2db'

server '188.166.6.221', user: 'seo', roles: %w(web app db), port: 2395
