require 'rake'
require 'hanami/rake_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task default: :spec

configure { set :server, :puma }
