# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api_grade/version'

Gem::Specification.new do |spec|
  spec.name          = 'api_grade'
  spec.version       = ApiGrade::VERSION
  spec.authors       = ['flowerwrong']
  spec.email         = ['sysuyangkang@gmail.com']
  spec.summary       = %q{A gem to query grade of university student.}
  spec.description   = %q{A gem to query grade of university student, it's the api of our server.}
  spec.homepage      = 'https://github.com/FlowerWrong'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'yard', '~> 0.8'
  spec.add_development_dependency 'rspec', '~> 3.1'

  spec.add_dependency 'rest-client', '~> 1.7'
  spec.add_dependency 'nokogiri', '~> 1.6'
end
