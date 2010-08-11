Given /^I click on image "([^"]*)"$/ do |arg1|
  find("##{arg1}").click
end