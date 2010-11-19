When /^I click on image "([^"]*)"$/ do |arg1|
  find("##{arg1}").click
end

Wenn /^ich das Bild "([^"]*)" anklicke$/ do |arg1|
  find("##{arg1}").click
end

Then /^I should see a date within "([^"]*)"$/ do |selector|
  with_scope(selector) do
      page.text.should match(/(\d{2})\.(\d{2})\.(\d{4})/)
  end
end
