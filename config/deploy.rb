#############################################################
# Deploy file for Rehash
#
# Set up for deployment from a github repo to a server running 
# the Passenger gem
#
# unique configuration values are kept in 
# config/deployment.yml, which is not version controlled.
# cp config/deployment.sample.yml config/deployment.yml and customize
# the file for your needs. 
#############################################################
CONFIG = YAML.load_file("config/deployment.yml")

set :application, CONFIG['application']
set :user, CONFIG['deploy_user']
set :port, CONFIG['port'] 
set :deploy_to, CONFIG['deploy_to']

role :app, CONFIG['application']
role :web, CONFIG['application']
role :db,  CONFIG['application'], :primary => true

#############################################################
#  Github
############################################################# 
set :scm, "git"
default_run_options[:pty] = true
set :repository,  "git@github.com:#{CONFIG['github_username']}/#{CONFIG['repo_name']}.git"
 
set :ssh_options, { :forward_agent => true }
set :branch, "#{CONFIG['branch']}"
 
# set deploy to copy to local first, then upload
set :deploy_via, :copy
set :runner, user

#############################################################
#	Passenger and application configuration
#############################################################
namespace :deploy do
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
   run "touch #{current_path}/tmp/restart.txt"
  end
  desc "make release directory before deploy migrations" 
  task :make_dirs do
    run "mkdir #{release_path}"
    run "mkdir #{release_path}/config"
    run "touch #{release_path}/config/database.yml"
  end 
  desc "Symlink required files for app"
  task :symlink_files do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
  # No background/cron tasks at this time.
  # desc "Update the crontab file"
  #   task :update_crontab, :roles => :db do
  #     run "cd #{release_path} && whenever --update-crontab #{application}"
  #   end
  # after "deploy:symlink", "deploy:update_crontab"
end
before "deploy:migrations", "deploy:make_dirs"
before "deploy:migrations", "deploy:symlink_files"
after "deploy", "deploy:symlink_files"

###########################################################################################################
#  Install gems on remote server: http://henrik.nyh.se/2008/10/cap-gems-install-and-a-gem-dependency-gotcha
###########################################################################################################
namespace :gems do
  desc "Install gems"
  task :install, :roles => :app do
    run "cd #{current_path} && #{sudo} rake RAILS_ENV=production gems:install"
  end
end