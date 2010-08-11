unless ENV['CUCUMBER_HOST']
  raise 'You must set CUCUMBER_HOST environment variable with the name of your host used to run cucumber features'
end

# RSpec
require 'spec/expectations'

# Caybara
require 'capybara/cucumber'
require 'capybara/session'

#Selenium
require "selenium-webdriver"

Capybara.default_selector = :css
Capybara.default_driver = :selenium

require 'test/unit/assertions'

World(Test::Unit::Assertions)

#Webrat.configure do |config|
#  config.mode = :selenium
#  config.application_framework = :external
#  config.application_address = ENV['CUCUMBER_HOST']
#  config.application_port = "80"
#end

#World do
#  session = Webrat::Session.new
#  session.extend(Webrat::Methods)
#  session.extend(Webrat::Matchers)
#  session
#end