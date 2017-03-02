set :application, "virusdobem"
set :repository,  "git@github.com:rarolabs/virusdobem.git"
set :scm, :git
set :stages, %w(production staging)
set :default_stage, "production"
set :linked_files, %w{ config/database.yml }

require 'bundler/capistrano'

require "rvm/capistrano"
require 'capistrano-unicorn'

set :rvm_autolibs_flag, "read-only"

require 'capistrano/ext/multistage'
