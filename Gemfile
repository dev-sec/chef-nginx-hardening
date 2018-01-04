# encoding: utf-8

source 'https://rubygems.org'

gem 'berkshelf', '~> 6.1'
gem 'chef', '~> 12.5' # chefspec builds get stucked with 13.1

group :test do
  gem 'rake'
  gem 'chefspec', '~> 7.1.0'
  gem 'foodcritic', '~> 11.1'
  gem 'thor', '~> 0.19.1'
  gem 'thor-foodcritic'
  gem 'cookstyle'
  gem 'coveralls', require: false
  gem 'minitest', '~> 5.10.2'
  gem 'rubocop', '~> 0.49.0'
  gem 'simplecov', '~> 0.10'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-foodcritic', '~> 3.0'
  gem 'guard-kitchen'
  gem 'guard-rubocop'
end

group :integration do
  gem 'test-kitchen', '~> 1.16.0'
  gem 'kitchen-vagrant'
  gem 'kitchen-dokken'
  gem 'kitchen-inspec'
  gem 'concurrent-ruby', '~> 1.0.5'
end

group :tools do
  gem 'github_changelog_generator', '~> 1.14'
end
