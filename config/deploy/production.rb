set :application, 'virusdobem'
set :keep_releases, 5
set :rails_env, 'production'

set :scm, 'git'
set :repository, 'git@git.rarolabs.com.br:rarolabs/frater.git'
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
  'BUNDLE_PATH'  => 'usr/local/.rvm/gems/ruby-2.2.1@global/bin/bundle',
  'PATH' => "/usr/local/rvm/gems/ruby-2.2.1/bin:/usr/local/rvm/gems/ruby-2.2.1@global/bin:/usr/local/rvm/rubies/ruby-2.2.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/local/rvm/bin:/root/bin",
  'RUBY_VERSION' => "2.2.1p85",
  'GEM_HOME' => "/usr/local/rvm/gems/ruby-2.2.1",
  'GEM_PATH' => "/usr/local/rvm/gems/ruby-2.2.1:/usr/local/rvm/gems/ruby-2.2.1@global",
  'LANG' => 'en_US.UTF-8'
}

set :rvm_ruby_string, "ruby-2.2.1"


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
end