# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'log/parser/version'

Gem::Specification.new do |spec|
  spec.name          = "log-parser"
  spec.version       = Log::Parser::VERSION
  spec.authors       = ["leo"]
  spec.email         = ["facenord.sud@gmail.com"]
  spec.description   = %q{fetch logstasher file log from remote server and add it to a local log files. Start logstash, elastic search and kibana but need executable in path}
  spec.summary       = %q{see description}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   << 'fetch-log'
  spec.executables   << 'read-log'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'net-scp'
end
