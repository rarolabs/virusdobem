set :stages, %w(production staging)
set :default_stage, "production"

set :application, "virusdobem"
set :repo_url, "git@github.com:rarolabs/virusdobem.git"

set :linked_files, %w{ config/database.yml }
set :linked_dirs, %w{ log public/assets }
set :pty, true
set :rvm_ruby_version, '2.2.1'

set :keep_releases, 5
