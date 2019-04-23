source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 5.2.1", ">= 5.2.1.1"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "figaro", "~> 1.1.1"
gem "bcrypt", "~> 3.1.7"
gem "config"
gem "paranoia", "~> 2.4"
gem "sidekiq"
gem "kaminari"
gem "active_model_serializers"
gem "rack-cors"
gem "rack-attack"
gem "swagger-docs"
gem "jwt"
gem "ransack"


group :development, :test do
  gem "pry"
  gem "pry-byebug"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "faker"
  gem "factory_bot_rails"
  gem "rubocop", require: false
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "shoulda-matchers", "~> 3.1.2"
  gem "rspec-rails", "~> 3.8"
  gem "database_cleaner"
  gem "timecop"
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
