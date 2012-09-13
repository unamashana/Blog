# Campfire
require 'capistrano/campfire'

set :application, "sb_blog"
set :repository,  "_site"
set :scm,               :none
set :deploy_via,        :copy
set :copy_compression,  :gzip
set :use_sudo,          false

set :deploy_to, "/home/rails/apps/#{application}"

# Server is defined in stage specific file
set :user, 'rails'    

set :campfire_options, :account => 'supportbee',
                       :room => 'SupportBee',
                       :token => '3b6227280f2699d4a85144e131bfe73ee85581ba',
                       :ssl => true

role :app, "web1.supportbee.com", "web2.supportbee.com"                          # This may be the same as your `Web` server

before 'deploy:update', 'deploy:update_jekyll'

before "deploy", "campfire:start_deployment"

after "deploy", "campfire:after_deployment"

namespace(:campfire) do
  task :start_deployment do
    campfire_room.speak "[Deployment] #{ENV['USER']} is preparing to deploy #{application} to blog.supportbee.com" 
  end

  task :after_deployment do 
    campfire_room.speak "[Deployment] #{ENV['USER']} finished deploying #{application} to blog.supportbee.com" 
  end
end
namespace :deploy do

  [:start, :stop, :restart, :finalize_update].each do |t|
    desc "#{t} task is a no-op with jekyll"
    task t, :roles => :app do ; end
  end
  
  desc 'Run jekyll to update site before uploading'
  task :update_jekyll do
    %x(rm -rf _site/* )
    require 'jekyll'
  	opt = Jekyll.configuration({})
  	source = opt['source']
  	destination = opt['destination']
  	site = Jekyll::Site.new(opt.merge({'auto' => 'false', 'env' => 'production'}))
  	puts "Building site: #{source} -> #{destination}"
  	begin
    	site.process
  	rescue Jekyll::FatalException => e
   		puts
    	puts "ERROR: YOUR SITE COULD NOT BE BUILT:"
    	puts "------------------------------------"
    	puts e.message
    	exit(1)
  	end
  	puts "Successfully generated site: #{source} -> #{destination}"
  end
  
end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
