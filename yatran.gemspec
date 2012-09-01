# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require File.expand_path('../lib/yatran/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Igor"]
  gem.email         = ["fedoronchuk@gmail.com"]
  gem.description   = %q{unofficial http://api.yandex.ru/translate API Client for ruby }
  gem.summary       = %q{ automatic translations and language detecting }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "yatran"
  gem.require_paths = ["lib"]
  gem.version       = Yatran::VERSION
end
