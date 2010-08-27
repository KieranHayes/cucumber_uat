When /^I click on image "([^"]*)"$/ do |arg1|
  find("##{arg1}").click
end

Wenn /^ich das Bild "([^"]*)" anklicke$/ do |arg1|
  find("##{arg1}").click
end