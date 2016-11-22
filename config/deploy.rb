# config valid only for Capistrano 3.1
# lock '3.2.1'

set :application, 'testcap'
set :repo_url, 'git@github.com:Liber17321/testcap.git'

#set :rvm1_ruby_version, ENV['GEM_HOME'].gsub(/.*\/|@.*\z/, '')

set :user, 'ubuntu'
set :rvm_ruby_version, '2.3.1'

# fetch(:default_env).merge!(rvm_path: '/usr/local/rvm/bin/rvm')

set :git_shallow_clone, 1
set :use_sudo, false

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/var/apps/#{fetch(:application)}"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
# set :linked_files, %w{config/mongoid.yml config/config.yml}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :bundle_without, %w(development test integration_test).join(' ')

# Default value for keep_releases is 5
set :keep_releases, 20

namespace :deploy do
  desc 'upload assets files to nginx'
  task :upload_assets_files do
    on roles(:app) do
      execute 'ruby /var/apps/testcap/current/app/assets/stylesheets/client.rb'
    end
  end

end






#
# desc 'upload assets files to nginx'
# task :upload_assets_files do
#   on roles(:assets_uploader) do
#        execute "ruby /Users/weldontim/Documents/work_log/client.rb"
#   end
# end
# #

# config valid only for current version of Capistrano
# lock '3.6.1'
#
# set :application, 'my_app_name'
# set :repo_url, 'git@example.com:me/my_repo.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
