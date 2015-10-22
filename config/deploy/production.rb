set :application, 'virusdobem'
set :keep_releases, 5
set :rails_env, 'production'

set :scm, 'git'
set :repository, 'git@github.com:rarolabs/virusdobem.git'
set :branch, 'master'
set :deploy_via, :remote_cache

default_run_options[:pty]   = true
ssh_options[:forward_agent] = true

set :user, 'root'
set :port, 22
set :use_sudo, false

set(:unicorn_env) { rails_env }

load 'deploy/assets'

set :default_environment, {
  'BUNDLE_PATH'  => '/usr/local/rvm/gems/ruby-2.2.1/bin/bundle',
  'PATH' => "/usr/local/rvm/gems/ruby-2.2.1/bin:/usr/local/rvm/gems/ruby-2.2.1@global/bin:/usr/local/rvm/rubies/ruby-2.2.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/local/rvm/bin:/root/bin",
  'RUBY_VERSION' => "2.2.1p85",
  'GEM_HOME' => "/usr/local/rvm/gems/ruby-2.2.1",
  'GEM_PATH' => "/usr/local/rvm/gems/ruby-2.2.1:/usr/local/rvm/gems/ruby-2.2.1@global",
  'LANG' => 'en_US.UTF-8'
}

set :rvm_ruby_string, "ruby-2.2.1"
set :rvm_type, :system


server '104.236.244.181', :web, :app, :db, :primary => true

set :deploy_to, "/app/virusdobem/"


require "bundler/capistrano"

after "deploy:restart", "deploy:cleanup"

before 'deploy:setup', 'rvm:install_rvm'
after 'deploy:restart', 'unicorn:restart'
before "deploy:assets:precompile", "deploy:migrate"

before 'deploy:finalize_update', 'deploy:assets:symlink'
after 'deploy:update_code', 'deploy:assets:precompile'

after :deploy, 'deploy:restart'
namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
      run "cd #{current_path} && touch tmp/restart.txt"
  end
  namespace :assets do
    task :precompile, :roles => :web do
        from = source.next_revision(current_revision)
        run_locally("RAILS_ENV=production rake assets:clean && RAILS_ENV=production rake assets:precompile")
        run_locally "cd public && tar -jcf assets.tar.bz2 assets"
        top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
        run "rm -rf #{shared_path}/assets"
        run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
        run_locally "rm public/assets.tar.bz2"
        run_locally("RAILS_ENV=production rake assets:clean")
        run_locally "rm -rf public/assets"
        run_locally "rm -rf tmp/cache/assets"
    end

    task :symlink, roles: :web do
      run ("rm -rf #{latest_release}/public/assets &&
            mkdir -p #{latest_release}/public &&
            mkdir -p #{shared_path}/assets &&
            ln -s #{shared_path}/assets #{latest_release}/public/assets")
    end
  end
end