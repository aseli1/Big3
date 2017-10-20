# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "big_3/version"

Gem::Specification.new do |spec|
  spec.name          = "big_3"
  spec.version       = Big3::VERSION
  spec.authors       = ["Anthony"]
  spec.email         = ["anthony.seliga@gmail.com"]

  spec.summary       = %q{Big3 statistics}
  spec.description   = %q{Team and player statistics from the Big3 basketball league.}
  spec.homepage      = "https://github.com/aseli1/Big3.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib","lib/big_3"]

  spec.add_runtime_dependency "nokogiri", "~> 1.6"
  spec.add_runtime_dependency "nori", "~> 2.6"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
