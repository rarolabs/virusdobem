server '162.243.40.20', user: "leonardo", roles: %w{app db web}
set :branch, 'master'
set :rails_env, 'production'
set :deploy_to, '/app/virusdobem/'
set :unicorn_pid, '/app/virusdobem/pids/unicorn.pid'

# # require 'bundler/capistrano'
# # require "rvm/capistrano"
# # require 'capistrano3-unicorn'
#
# # set :application, 'virusdobem'
# # set :keep_releases, 5
# set :rails_env, 'production'
# # set :rvm_ruby_string, "ruby-2.2.1"
# # set :rvm_autolibs_flag, "read-only"
# # set :default_environment, {
# #   'BUNDLE_PATH'  => '/home/leonardo/.rvm/gems/ruby-2.2.1@global/bin/bundle',
# #   'PATH' => "/home/leonardo/.rvm/gems/ruby-2.2.1/bin:/home/leonardo/.rvm/gems/ruby-2.2.1@global/bin:/home/leonardo/.rvm/rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/leonardo/.rvm/bin:/home/leonardo/.local/bin:/home/leonardo/bin",
# #   'RUBY_VERSION' => "2.2.1p85",
# #   'GEM_HOME' =>"/home/leonardo/.rvm/gems/ruby-2.2.1",
# #   'GEM_PATH' => "/home/leonardo/.rvm/gems/ruby-2.2.1:/home/leonardo/.rvm/gems/ruby-2.2.1@global",
# #   'LANG' => 'en_US.UTF-8'
# # }
# set :linked_files, %w{ config/database.yml }
# # set :scm, 'git'
# # set :repository, 'git@github.com:rarolabs/virusdobem.git'
# set :branch, 'master'
# set :deploy_via, :remote_cache
#
# # default_run_options[:pty]   = true
# # ssh_options[:forward_agent] = true
#
# # set :user, 'leonardo'
# # set :port, 22
# # set :use_sudo, false
#
# set(:unicorn_env) { rails_env }
#
# # load 'deploy/assets'
#
# # server '162.243.40.20', :web, :app, :db, :primary => true
# server '162.243.40.20', user: "leonardo", roles: %w{app db web}
#
# set :deploy_to, "/app/virusdobem/"
