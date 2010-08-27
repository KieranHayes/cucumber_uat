# German versions of the web steps

Gegebensei /^(?:|ich )bin auf (.+)$/ do |page_name|
  visit path_to(page_name)
end

Wenn /^(?:|ich )auf (.+) gehe$/ do |page_name|
  visit path_to(page_name)
end

Wenn /^(?:|ich )auf den Button "([^"]*)"(?: innerhalb von "([^"]*)")? klicke$/ do |button, selector|
  with_scope(selector) do
    click_button(button)
  end
end

Wenn /^(?:|I )dem Link "([^"]*)"(?: innerhalb von "([^"]*)")? folge$/ do |link, selector|
  with_scope(selector) do
    click_link(link)
  end
end

Wenn /^(?:|ich )das Feld "([^"]*)" mit "([^"]*)"(?: innerhalb von "([^"]*)")? ausfülle$/ do |field, value, selector|
  with_scope(selector) do
    fill_in(field, :with => value)
  end
end

Wenn /^(?:|ich )den Wert "([^"]*)" in das Feld "([^"]*)"(?: innerhalb von "([^"]*)")? eintrage$/ do |value, field, selector|
  with_scope(selector) do
    fill_in(field, :with => value)
  end
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.
#
When /^(?:|I )fill in the following(?: within "([^"]*)")?:$/ do |selector, fields|
  with_scope(selector) do
    fields.rows_hash.each do |name, value|
      When %{I fill in "#{name}" with "#{value}"}
    end
  end
end

Wenn /^(?:|ich )den Wert "([^"]*)" von "([^"]*)"(?: innerhalb von "([^"]*)")? selektiere$/ do |value, field, selector|
  with_scope(selector) do
    select(value, :from => field)
  end
end

Wenn /^(?:|ich )die Checkbox "([^"]*)"(?: innerhalb von "([^"]*)")? aktiviere$/ do |field, selector|
  with_scope(selector) do
    check(field)
  end
end

Wenn /^(?:|ich )die Checkbox "([^"]*)"(?: innerhalb von "([^"]*)")? deaktivere$/ do |field, selector|
  with_scope(selector) do
    uncheck(field)
  end
end

When /^(?:|ich )den Wert "([^"]*)"(?: innerhalb von "([^"]*)")? auswähle$/ do |field, selector|
  with_scope(selector) do
    choose(field)
  end
end

When /^(?:|ich )die Datei "([^"]*)" an das Feld "([^"]*)"(?: innerhalb von "([^"]*)")? hänge$/ do |path, field, selector|
  with_scope(selector) do
    attach_file(field, path)
  end
end

Dann /^sollte (?:|ich )folgendes JSON: sehen$/ do |expected_json|
  require 'json'
  expected = JSON.pretty_generate(JSON.parse(expected_json))
  actual   = JSON.pretty_generate(JSON.parse(response.body))
  expected.should == actual
end

Dann /^sollte (?:|ich )den Text "([^"]*)"(?: innerhalb von "([^"]*)")? sehen$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Dann /^sollte (?:|ich )den Ausdruck \/([^\/]*)\/(?: innerhalb von "([^"]*)")? sehen$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_xpath('//*', :text => regexp)
    else
      assert page.has_xpath?('//*', :text => regexp)
    end
  end
end

Dann /^sollte (?:|ich )den Text "([^"]*)"(?: innerhalb von "([^"]*)")? nicht sehen$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_no_content(text)
    else
      assert page.has_no_content?(text)
    end
  end
end

Dann /^sollte (?:|ich )den Ausdruck \/([^\/]*)\/(?: innerhalb von "([^"]*)")? nicht sehen$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_no_xpath('//*', :text => regexp)
    else
      assert page.has_no_xpath?('//*', :text => regexp)
    end
  end
end

Dann /^sollte das Feld "([^"]*)" field(?: innerhalb von "([^"]*)")? den Wert "([^"]*)" enthalten$/ do |field, selector, value|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should
      field_value.should =~ /#{value}/
    else
      assert_match(/#{value}/, field_value)
    end
  end
end

Dann /^sollte das Feld "([^"]*)" field(?: innerhalb von "([^"]*)")? nicht den Wert "([^"]*)" enthalten$/ do |field, selector, value|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should_not
      field_value.should_not =~ /#{value}/
    else
      assert_no_match(/#{value}/, field_value)
    end
  end
end

Then /^the "([^"]*)" checkbox(?: within "([^"]*)")? should be checked$/ do |label, selector|
  with_scope(selector) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_true
    else
      assert field_checked
    end
  end
end

Then /^sollte "([^"]*)" checkbox(?: innerhalb von "([^"]*)")? nicht markiert sein$/ do |label, selector|
  with_scope(selector) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_false
    else
      assert !field_checked
    end
  end
end
 
Dann /^sollte (?:|ich )auf (.+) sein$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^sollte (?:|ich )den folgenden URL-Pfad sehen:$/ do |expected_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  expected_pairs.rows_hash.each_pair{|k,v| expected_params[k] = v.split(',')} 
  
  if actual_params.respond_to? :should
    actual_params.should == expected_params
  else
    assert_equal expected_params, actual_params
  end
end

Dann /^zeige mir die Seite$/ do
  save_and_open_page
end