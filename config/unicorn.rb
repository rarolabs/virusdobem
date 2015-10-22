# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/app/virusdobem/current"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/app/virusdobem/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/app/virusdobem/current/log/unicorn.log"
stdout_path "/app/virusdobem/current/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.virusdobem.sock"

# Number of processes
# worker_processes 4
worker_processes 1

# Time-out
timeout 60

before_fork do |server, worker|
 if defined?(ActiveRecord::Base)
   ActiveRecord::Base.connection.disconnect!
 end
end

after_fork do |server, worker|
 if defined?(ActiveRecord::Base)
   config = ActiveRecord::Base.configurations[Rails.env] ||
               Rails.application.config.database_configuration[Rails.env]
   config['reaping_frequency'] =  20 # seconds
   config['pool'] = 20
   ActiveRecord::Base.establish_connection(config)
 end
end