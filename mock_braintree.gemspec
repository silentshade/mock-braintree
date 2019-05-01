
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mock_braintree/version"

Gem::Specification.new do |spec|
  spec.name          = "mock_braintree"
  spec.version       = MockBraintree::VERSION
  spec.authors       = ["Brent Busby"]
  spec.email         = ["brent.busby@yahoo.com"]
  spec.summary       = "A library for mocking Braintree calls and responses in your tests."
  spec.homepage      = "https://github.com/buzzamus/mock-braintree"
  spec.license       = "MIT"


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
