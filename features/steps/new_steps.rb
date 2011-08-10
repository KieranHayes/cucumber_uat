When /^I click on element "([^"]*)"$/ do |element|
  find(selector_for(element)).click
end

Wenn /^ich das Element "([^"]*)" anklicke$/ do |element|
  find(selector_for(element)).click
end