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

#Change engine to chrome in order to test a webkit browser
#Selenium::WebDriver.for :chrome

Capybara.default_selector = :css
Capybara.default_driver = :selenium

require 'test/unit/assertions'

World(Test::Unit::Assertions)