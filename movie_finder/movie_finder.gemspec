# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "movie_finder/version"

Gem::Specification.new do |spec|
  spec.name          = "movie_finder"
  spec.version       = MovieFinder::VERSION
  spec.authors       = ["'Nicholas Halloran'"]
  spec.email         = ["'nmhalloran@hotmail.com'"]

  spec.summary       = "This gem allows the user to scrape data from the Dedham Community Theatre website, and pull movie information and showtimes."
  spec.homepage      = ""
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", '~> 0'

  spec.add_dependency "nokogiri"
  spec.add_dependency "httparty", '~> 0'

end
