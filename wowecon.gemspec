Gem::Specification.new do |spec|
  spec.name                  = 'wowecon'
  spec.version               = '0.1.0'
  spec.date                  = '2011-06-30'
  spec.summary               = "wowecon"
  spec.description           = "Ruby API to wowecon.com market data."
  spec.authors               = ["Ben Darlow"]
  spec.email                 = 'ben@kapowaz.net'
  spec.files                 = Dir["lib/**/*"]
  spec.test_files            = Dir["spec/*"]
  spec.homepage              = 'http://github.com/kapowaz/wowecon'
  spec.required_ruby_version = '>= 1.9.2'
  spec.add_runtime_dependency 'nokogiri', ['~> 1.4']
  spec.add_development_dependency 'rspec', ['~> 2.6']
end