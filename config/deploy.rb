require 'torquebox-capistrano-support'
require 'bundler/capistrano'
require 'rvm/capistrano'

set :default_environment, {
  'PATH' => "/usr/local/rvm/gems/jruby-1.7.4@global/bin:/usr/local/rvm/rubies/jruby-1.7.4/bin:/usr/local/rvm/bin:/usr/local/bin:/usr/bin:/bin",
  'RUBY_VERSION' => 'jruby-1.7.4',
  'GEM_HOME'     => '/usr/local/rvm/gems/jruby-1.7.4@global',
  'GEM_PATH'     => '/usr/local/rvm/gems/jruby-1.7.4@global',
  'BUNDLE_PATH'  => '/srv/www/mhtest/shared/bundle'  # If you are using bundler.
}

default_run_options[:pty] = true
set :application, "mhtest"
set :scm, :git 
set :repository,  "git://github.com/mhinton/mhtest.git"
set :user, "matthew"
set :use_sudo, false

# Production server
set :deploy_to,         "/srv/www/mhtest"

set :jruby_home, "/usr/local/rvm/rubies/jruby-1.7.4"
set :torquebox_home, "/usr/local/rvm/gems/jruby-1.7.4@global/gems/torquebox-server-2.3.0-java"
set :jboss_home, "/usr/local/rvm/gems/jruby-1.7.4@global/gems/torquebox-server-2.3.0-java/jboss"
# set :jboss_init_script, "/etc/init.d/jboss-as-standalone"
set :jboss_control_style, :binscripts
set :jboss_bind_address, "0.0.0.0:6666"
set :rails_env,         "production"
set :app_context,       "/mhtest"

role :web, "shire.commongroundpublishing.com"                          # Your HTTP server, Apache/etc
role :app, "shire.commongroundpublishing.com"                          # This may be the same as your `Web` server
role :db,  "shire.commongroundpublishing.com", :primary => true # This is where Rails migrations will run

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
