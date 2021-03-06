Gem::Specification.new do |spec|
  spec.name                  = 'wowecon'
  spec.version               = '0.2.5'
  spec.date                  = '2011-07-27'
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