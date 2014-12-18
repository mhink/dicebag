require "rubygems"
require "bundler/gem_tasks"

Bundler.require(:development)

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end
