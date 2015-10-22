set :application, "virusdobem"
set :repository,  "git@git.rarolabs.com.br:rarolabs/frater.git"
set :scm, :git
set :stages, %w(production staging)
set :default_stage, "production"

require 'bundler/capistrano'

require "rvm/capistrano"
require 'capistrano-unicorn'

set :rvm_autolibs_flag, "read-only"

require 'capistrano/ext/multistage'