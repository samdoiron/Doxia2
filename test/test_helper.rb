ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers

  # 1 worker because jruby doesn't support fork(2)
  parallelize(workers: 1)

  # Add more helper methods to be used by all tests here...
end
