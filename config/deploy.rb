# config valid only for Capistrano 3.4
lock '3.4.0'

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, '2.2.0'
set :rbenv_map_bins, %w{rake gem bundle ruby rails eye}

set :repo_url, 'git@github.com:dembskoi/ft2db.git'

set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :format, :pretty
set :log_level, :debug

set :linked_files, %w(config/database.yml .env)
set :linked_dirs, %w(log tmp/pids tmp/sockets vendor/bundle public/assets public/uploads)

set :keep_releases, 4

# Whenever
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      execute :eye, "restart #{fetch(:application)}"
    end
  end

  after :publishing, :restart

  before :restart, :update_eye do
    on roles(:app) do
      execute :mkdir, '-p /home/seo/eye'
      execute :ln, "-sf #{current_path}/config/eye.conf.#{fetch(:stage)} /home/seo/eye/#{fetch(:application)}.eye"
      execute :eye, "load /home/seo/eye/#{fetch(:application)}.eye"
    end
  end
end
