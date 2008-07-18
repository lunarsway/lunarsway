require "mt-capistrano"

set :site,         "40592"
set :application,  "lunarsway"
set :webpath,      "www.lunarsway.com"
set :domain,       "chemistryinspace.com"
set :user,         "serveradmin%chemistryinspace.com"
set :password,     "danielle"

set :ssh_options, { :forward_agent => true }

# repository on (gs)
# set :repository, "svn+ssh://#{user}@#{domain}/home/#{site}/data/repo/app1/trunk"

# repository elsewhere
#set :repository, "svn+ssh://user@other.com/usr/local/svn/repo/app1/trunk"
#set :repository, "https://other.com/usr/local/svn/repo/app1/trunk"
set :scm, :git
set :repository,              "git@github.com:lunarsway/lunarsway.git"
set :branch,                  "master"
# set :scm_password,            "fattoush"
set :checkout, "export"

# which environment to work in
set :rails_env,    "production"

# necessary for functioning on the (gs)
default_run_options[:pty] = true

# these shouldn't be changed
role :web, "#{domain}"
role :app, "#{domain}"
role :db,  "#{domain}", :primary => true
set :deploy_to,    "/home/#{site}/containers/rails/#{application}"
set :current_deploy_dir, "#{deploy_to}/current"
set :tmp_dir, "#{deploy_to}/tmp"

# uncomment if desired
after "deploy:update_code".to_sym do
  put File.read("deploy/database.yml.mt"), "#{release_path}/config/database.yml", :mode => 0444
  run <<-CMD
    cd #{release_path} &&
    rm #{release_path}/fleximages &&
    rm #{release_path}/audio &&
    rm #{release_path}/play &&
    ln -nfs #{shared_path}/audio #{release_path}/audio &&
    ln -nfs #{shared_path}/fleximages #{release_path}/fleximages &&
    ln -nfs #{shared_path}/play #{release_path}/play
  CMD
end


task :mtr_init, :roles => :app do
  run <<-CMD
    cd $HOME/../../containers &&
    mkdir -p rails &&
    cd rails &&
    mkdir -p #{application} &&
    cd #{application} &&
    mkdir -p current &&
    cd current &&
    mtr add #{application} $PWD #{webpath}
  CMD
  run "mkdir -p $HOME/../../containers/rails/#{application}/shared"
  run "mkdir -p $HOME/../../containers/rails/#{application}/shared/log"
end

task :mtr_create_link, :roles => :app do
  run "mtr create_link #{application}"
end

namespace(:deploy) do
  task :restart do
    run "mtr restart #{application}"
  end
  task :setup_htaccess do
    run "mtr restart #{application}"
    run "mtr generate_htaccess #{application}"    
  end
  task :long do
    # run "mtr stop #{application}"
    transaction do
      update_code
      # web.disable
      symlink
      # symlink_configs
      # symlink_storage
      # migrate
      # my_migrate
      # setup_htaccess
    end
  
    #haml
    # restart
    run "mtr restart #{application}"
    # warmup
    # web.enable
  end
end

# update .htaccess rules after new version is deployed
after "deploy:symlink".to_sym, "mt:generate_htaccess".to_sym