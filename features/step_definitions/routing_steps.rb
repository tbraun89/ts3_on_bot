Given /^I want to see the (.+) page$/ do |page_name|
  visit send("#{page_name}_path")
end

When /^I want to see the (.+) page for id (\d+)$/ do |page_name, id|
  visit send("#{page_name}_path", id)
end

Then /^I should be redirected to the (.+) page$/ do |page_name|
  page.current_path.should == send("#{page_name}_path")
end
