# encoding: utf-8

source 'https://rubygems.org'

gem 'berkshelf', '~> 8.0'
gem 'chef', '~> 18'

group :test do
  gem 'rake'
  gem 'chefspec', '~> 9.3.0'
  gem 'foodcritic', '~> 16.0'
  gem 'cookstyle', '~> 7'
  gem 'coveralls', require: false
  gem 'minitest', '~> 5.19.0'
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
  gem 'test-kitchen', '~> 3.5.0'
  gem 'kitchen-vagrant'
  gem 'kitchen-dokken'
  gem 'kitchen-inspec'
  gem 'concurrent-ruby', '~> 1.2.0'
end

group :tools do
  gem 'github_changelog_generator', '~> 1.14'
end
