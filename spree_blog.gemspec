# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_blog'
  s.version     = '2.0.7'
  s.summary     = 'Add blogging functionality to spree'
  s.description = 'Add blogging functionality to spree'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'David Librera, Stefano Verna'
  s.email     = 'davidlibrera@gmail.com, stefano.verna@gmail.com'
  s.homepage  = 'https://github.com/cantierecreativo/spree_blog'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.1.2'
  s.add_dependency 'spree_editor'

  s.add_development_dependency 'capybara'#, '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'#, '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails'#,  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
