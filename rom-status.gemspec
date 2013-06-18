# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name        = 'rom-status'
  gem.version     = '0.0.2'
  gem.authors     = [ 'Markus Schirp' ]
  gem.email       = [ 'mbj@seonic.net' ]
  gem.description = 'A small status site'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/mbj/rom-status'

  gem.require_paths    = [ 'lib' ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- spec`.split("\n")
  gem.extra_rdoc_files = %w[TODO]

  gem.add_dependency('adamantium',    '~> 0.0.7')
  gem.add_dependency('concord',       '~> 0.1.0')
  gem.add_dependency('anima',         '~> 0.0.6')
  gem.add_dependency('equalizer',     '~> 0.0.5')
  gem.add_dependency('haml',          '~> 4.0.0')
  gem.add_dependency('html',          '~> 0.0.1')
  gem.add_dependency('request',       '~> 0.0.2')
  gem.add_dependency('response',      '~> 0.0.2')
  gem.add_dependency('susy',          '~> 1.0.5')
  gem.add_dependency('compass',       '~> 0.12.2')

  gem.executables = [ 'status-build', 'status-update' ]
end
