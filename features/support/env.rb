unless ENV['CUCUMBER_HOST']
  raise 'You must set CUCUMBER_HOST environment variable with the name of your host used to run cucumber features'
end

# RSpec
require 'spec/expectations'

# Webrat
require 'webrat'

require 'test/unit/assertions'
World(Test::Unit::Assertions)

Webrat.configure do |config|
  #config.mode = :mechanize
  config.mode = :selenium
  config.application_framework = :external
  config.application_address = ENV['CUCUMBER_HOST']
  config.application_port = "80"
end

World do
  session = Webrat::Session.new
  session.extend(Webrat::Methods)
  session.extend(Webrat::Matchers)
  session
end