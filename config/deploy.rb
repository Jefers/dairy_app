#server login
set :user, "waldenda"
set :keep_releases, 2
# RVM bootstrap
##$:.unshift(File.expand_path("~/.rvm/lib"))
##require 'rvm/capistrano'
##set :rvm_ruby_string, '1.9.2'
##set :rvm_type, :user

# main details
set :application, "dairy_app"
role :web, "waldendairy.com"
role :app, "waldendairy.com"
role :db,  "waldendairy.com", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache

# Necessary to run on Site5
set :use_sudo, false
set :group_writable, false
# repo details
set :scm, :git
set :scm_username, "Jefers"
set :repository, "git@github.com:Jefers/dairy_app.git"
set :branch, "master"
set :git_enable_submodules, 1

# runtime dependencies
depend :remote, :gem, "bundler", ">=1.0.0.rc.2"

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'

 # require 'bundler/capistrano'     :TODO try this out sometime  ref http://rails-bestpractices.com/posts/51-dry-bundler-in-capistrano
namespace :bundler do
  desc "Symlink bundled gems on each release"
  task :symlink_bundled_gems, :roles => :app do
    run "mkdir -p #{shared_path}/bundled_gems"
    run "ln -nfs #{shared_path}/bundled_gems #{release_path}/vendor/bundle"
  end

  desc "Install for production"
  task :install, :roles => :app do
    run "cd #{release_path} && bundle install --deployment"
  end

end

after 'deploy:update_code', 'bundler:symlink_bundled_gems'
after 'deploy:update_code', 'bundler:install'
