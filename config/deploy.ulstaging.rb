set :keep_releases,           5
set :application,             "lunarsway"
set :repository,              "git@github.com:lunarsway/lunarsway.git"
set :branch,                  "master"
set :user,                    'upgraded'
set :password,                '4v33dPr3st0n'
set :deploy_to,               '/home/upgraded/lunarsway/www'

set :monit_group,             'lunarsway'
set :scm, :git
set :scm_password, "danielle"

set :ssh_options, { :forward_agent => true, :port => 2898 }

default_run_options[:pty] = true

task :production do
  role :web, '67.207.135.181'
  role :app, '67.207.135.181'
  role :db, '67.207.135.181', :primary => true
end

#after 'deploy', 'deploy:cleanup'
#after 'deploy:migrations', 'deploy:cleanup'
#after 'deploy_update_code', 'deploy:symlink_configs'

# TODO
# => use nginx instead of script/server
namespace :nginx do
  desc "Start server."
  task :start, :roles => :app do
    # sudo '/home/upgraded/wcr/www/current/script/server -d'
  end
end

# =============================================================================  
namespace :mongrel do
  task :tail_6000, :roles => :app do
    run "tail -f /home/upgraded/lunarsway/www/shared/log/mongrel.6000.log" do |channel, stream, data|
      puts "#{channel[:server]}: #{data}" unless data =~ /^10\.0\.0/
      break if stream == :err
    end
  end
  task :tail_6001, :roles => :app do
    run "tail -f /home/upgraded/lunarsway/www/shared/log/mongrel.6001.log" do |channel, stream, data|
      puts "#{channel[:server]}: #{data}" unless data =~ /^10\.0\.0/
      break if stream == :err
    end
  end
  task :tail_6002, :roles => :app do
    run "tail -f /home/upgraded/lunarsway/www/shared/log/mongrel.6002.log" do |channel, stream, data|
      puts "#{channel[:server]}: #{data}" unless data =~ /^10\.0\.0/
      break if stream == :err
    end
  end
  desc <<-DESC
  Start Mongrel processes on the app server.  This uses the :use_sudo variable to determine whether to use sudo or not. By default, :use_sudo is
  set to true.
  DESC
  task :start, :roles => :app do
    #sudo "/usr/local/bin/monit quit"
    #sleep(4)
    #sudo "/usr/local/bin/monit"
    sudo "/usr/sbin/monit start all -g #{monit_group}"
    #sudo "/usr/local/bin/mongrel_rails cluster::start -C #{deploy_to}/current/config/mongrel_cluster.yml"
  end

  desc <<-DESC
  Restart the Mongrel processes on the app server by starting and stopping the cluster. This uses the :use_sudo
  variable to determine whether to use sudo or not. By default, :use_sudo is set to true.
  DESC
  task :restart, :roles => :app do
    sudo "/usr/local/bin/monit restart all -g #{monit_group}"
    #sudo "/usr/local/bin/mongrel_rails cluster::restart -C #{deploy_to}/current/config/mongrel_cluster.yml"
    #stop
    #sleep(5)
    #start
  end

  desc <<-DESC
  Stop the Mongrel processes on the app server.  This uses the :use_sudo
  variable to determine whether to use sudo or not. By default, :use_sudo is
  set to true.
  DESC
  task :stop, :roles => :app do
    sudo "/usr/local/bin/monit stop all -g #{monit_group}"
    # sudo "/usr/local/bin/mongrel_rails cluster::stop -C #{deploy_to}/current/config/mongrel_cluster.yml"
  end
  
  task :ps, :roles => :app do
    sudo "ps x | grep mongrel"
  end
end


namespace(:deploy) do
  task :symlink_configs, :roles => :app, :except => {:no_symlink => true} do
    run <<-CMD
      cd #{release_path} &&
      rm #{release_path}/config/database.yml &&
      ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml &&
      ln -nfs #{shared_path}/config/mongrel_cluster.yml #{release_path}/config/mongrel_cluster.yml
    CMD
  end

  task :symlink_storage, :roles => :app, :except => {:no_symlink => true} do
    run <<-CMD
      cd #{release_path} &&
      rm -rf #{release_path}/fleximages &&
      rm -rf #{release_path}/audio &&
      rm -rf #{release_path}/public/play &&
      ln -nfs #{shared_path}/fleximages #{release_path}/fleximages &&
      ln -nfs #{shared_path}/audio #{release_path}/audio &&
      ln -nfs #{shared_path}/play #{release_path}/public/play
    CMD
  end

  desc "Clears the cache"
  task :cache_clear, :roles => :app, :except => {:no_release => true} do
    run <<-CMD
      cd #{deploy_to}/current && 
      rake tmp:cache:clear RAILS_ENV="#{ARGV[0]}"
    CMD
  end

  task :long do
    transaction do
      update_code
      web.disable
      symlink
      symlink_configs
      symlink_storage
      migrate
    end
    
    #haml
    restart
    # warmup
    web.enable
  end

  desc "Restart the Mongrel processes on the app server by calling restart_mongrel_cluster."
  task :restart, :roles => :app do
    mongrel.restart
    #sudo "monit -g mongrel restart all"
  end
  
  desc "Tail the Rails production log for this environment"
  task :tail_production_logs, :roles => :app do
    # run "tail -f #{shared_path}/log/#{ARGV[0]}.log" do |channel, stream, data|
    run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
      puts  # for an extra line break before the host name
      puts "#{channel[:server]}: #{data}"
      break if stream == :err    
    end
  end  
end