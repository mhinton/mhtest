require 'torquebox-capistrano-support'
require 'bundler/capistrano'

set :application, "mhtest"
set :repository,  "/home/matthew/mhtest"

set :scm, :git 

# Production server
set :deploy_to,         "/srv/web/mhtest"
# TODO: the following two settings need the correct values
#set :torquebox_home,    "/opt/torquebox/current"
#set :jboss_init_script, "/etc/init.d/jboss-as-standalone"
set :rails_env,         "production"
set :app_context,       "/mhtest"

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
