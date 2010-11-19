unless ENV['CUCUMBER_HOST']
  ENV['CUCUMBER_HOST'] = 'http://www.aldi-sued.de'
#  raise 'You must set CUCUMBER_HOST environment variable with the name of your host used to run cucumber features'
end

## ActiveRecord
#require 'active_record'
#
## RSpec
#require 'spec/expectations'
#
## Caybara
#require 'capybara/cucumber'
#require 'capybara/session'
#
##Selenium
#require 'selenium-webdriver'

# Webrat
#require "capybara/rack-test"
#require "capybara/envjs"

#Change engine to chrome in order to test a webkit browser
#Selenium::WebDriver.for :chrome

#Capybara.default_selector = :css
#Capybara.default_driver = :selenium

#Capybara.default_driver = :envjs
#Capybara.javascript_driver = :envjs

# Optional - wenn wir keine UnitTests auf "UnitBasis" verwenden
# Standardmäßig werden rspec tests verwendet (und auch von uns empfohlen)
# require 'test/unit/assertions'
# World(Test::Unit::Assertions)


# Activate fixtures
# @see https://github.com/aslakhellesoy/cucumber/wiki/Fixtures
# mkdir -p ./fixtures
# Before do
#   Fixtures.reset_cache
#   fixtures_folder = File.join(RAILS_ROOT, 'fixtures')
#   fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
#   Fixtures.create_fixtures(fixtures_folder, fixtures)
# end




# - - - - - - - Kieran
# RSpec
require 'spec/expectations'

# Caybara
#require 'httparty'
require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
#require 'cucumber/web/tableish'
require 'capybara/cucumber'
require 'capybara/session'
include Spec::Expectations


#Selenium
#require "selenium-webdriver"

#Change engine to chrome in order to test a webkit browser
#Selenium::WebDriver.for :chrome

Capybara.default_selector = :css
Capybara.default_driver = :culerity
Capybara.javascript_driver = :culerity
Capybara.run_server = false
require 'test/unit/assertions'

World(Test::Unit::Assertions)
