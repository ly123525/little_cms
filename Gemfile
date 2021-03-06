# source 'https://rubygems.org'
source "https://gems.ruby-china.org"
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#前端
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'nprogress-rails', '~> 0.2.0.2'

#验证码
gem 'rucaptcha', '~> 0.4.2'
#表单
gem 'simple_form', '~> 3.5'
gem 'client_side_validations', '~> 11.0'
gem 'client_side_validations-simple_form', '~> 6.5'
# 设置
gem 'rails-settings-cached', '~> 0.6.6'
# 异常记录
gem 'exception_notification', '~> 4.2', '>= 4.2.2'
# 分页
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
# 搜索表单
gem 'ransack', '~> 1.8', '>= 1.8.4'

gem 'rails-i18n', '~> 5.0', '>= 5.0.4'
gem 'enum_help', '~> 0.0.17'
gem 'codemirror-rails', '~> 5.16' #代码编辑器
# SEO
gem 'meta-tags', '~> 2.7'
# 嵌套模型表单
gem 'cocoon', '~> 1.2', '>= 1.2.11'
# 上传组件
gem 'carrierwave', '~> 1.2', '>= 1.2.2'
gem 'mini_magick', '~> 4.8'
gem 'mime-types', '~> 3.1'
# 无限极分类
gem 'awesome_nested_set', '~> 3.1', '>= 3.1.3'
