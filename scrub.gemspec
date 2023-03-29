Gem::Specification.new do |s|
  s.name        = "scrub"
  s.version     = "0.0.0"
  s.summary     = "tool to scrub PII"
  s.description = "Use this tool to scrub sensitive values in a json file. Just provide the keys you want to scrub"
  s.authors     = ["Philippe Balucan"]
  s.email       = "psbalucan@gmail.com"
  s.files       = ["lib/cli.rb", "lib/core_ext/array.rb", "lib/core_ext/number.rb", "lib/core_ext/bool.rb", "lib/core_ext/hash.rb", "lib/core_ext/string.rb"]
  s.homepage    =
    "https://google.com"
  s.license       = "MIT"
end