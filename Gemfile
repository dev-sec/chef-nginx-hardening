source 'https://rubygems.org'

gem 'berkshelf', '~> 6.3'
gem 'chef', '~> 12'

group :test do
  gem 'rake'
  gem 'chefspec', '~> 7.2.1'
  gem 'foodcritic', '~> 13.1'
  gem 'cookstyle', '~> 3'
  gem 'coveralls', require: false
  gem 'minitest', '~> 5.10.2'
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
