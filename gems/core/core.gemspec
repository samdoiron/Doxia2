Gem::Specification.new do |spec|
  spec.name = 'core'
  spec.authors = ["Sabrina Gannon", "Sam Doiron"]
  spec.version = "1.0.0"
  spec.summary = 'Core doxia rules'
  spec.files = Dir["lib/**"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"

  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-proveit'
  spec.add_development_dependency 'pry-byebug'
end