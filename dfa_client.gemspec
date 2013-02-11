Gem::Specification.new do |s|
  s.name        = 'dfa_client'
  s.version     = '0.0.1'
  s.date        = '2013-02-11'
  s.summary     = "A client for Google's DoubleClick for Advertisers (DFA) API"
  s.description = "A client for Google's DoubleClick for Advertisers (DFA) API - a wrapper for savon v2"
  s.authors     = ["RJ Pittman"]
  s.email       = 'rypitme@gmail.com'
  s.files       = ["lib/dfa_client.rb"]
  s.homepage    = 'http://rubygems.org/gems/dfa_client'
  s.add_dependency "savon", ">= 2"
end
