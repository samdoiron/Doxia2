ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup
