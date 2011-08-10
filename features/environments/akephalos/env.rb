unless ENV['CUCUMBER_HOST']
  raise 'You must set CUCUMBER_HOST environment variable with the name of your host used to run cucumber features'
end

# RSpec
require 'spec/expectations'

# Caybara
require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_selector = :css

# Akephalos & envjs
require 'akephalos'
require 'capybara/envjs'

Capybara.default_driver = :akephalos
Capybara.javascript_driver = :envjs
Capybara.register_driver :akephalos do |app|
  # available options:
  #   :ie6, :ie7, :ie8, :firefox_3, :firefox_3_6
  Capybara::Driver::Akephalos.new(app, :browser => :firefox_3_6)
end

require 'test/unit/assertions'

World(Test::Unit::Assertions)

at_exit do
  system "open ./reports/report.html"
end