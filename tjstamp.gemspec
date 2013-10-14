Gem::Specification.new do |s|
  s.name        = 'tjstamp'
  s.version     = '1.0.1'
  s.date        = '2013-10-14'
  s.summary     = 'A tool for generating Chinese charater stamp image.'
  s.description = "A tool for generating Chinese charater stamp image."
  s.authors     = ["Tony Jian"]
  s.email       = 'tonytonyjan@gmail.com'
  s.files       = ["lib/tjstamp.rb", "lib/simsun.ttf"]
  s.homepage    = 'https://github.com/tonytonyjan/tjstamp'
  s.license     = 'MIT'
  s.add_runtime_dependency 'rmagick'
end