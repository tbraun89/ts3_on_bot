Given /^I want to see the (.+) page$/ do |page_name|
  visit send("#{page_name}_path")
end

When /^I a?m? ?(not )?authenticated?( as (.+) \/\/ (.+))?$/ do |status, unused, username, password|
  unless status == "not "
    if username == "admin"
      FactoryGirl.create(:admin, :username => username, :password => password)
    else
      FactoryGirl.create(:user, :username => username, :password => password)
    end

    fill_in "user_username", :with => username
    fill_in "user_password", :with => password

    click_button "sign_in_btn"
  end
end

When /^I authenticate with wrong data$/ do
  fill_in "user_username", :with => "wrong"
  fill_in "user_password", :with => "userdata"

  click_button "sign_in_btn"
end

Then /^I should be redirected to the (.+) page$/ do |page_name|
  page.current_path.should == send("#{page_name}_path")
end

When /^see the "(.+)" (.+)/ do |content, type|
  selector = ""
  if type == "headline"
    selector = "h1"
  elsif type == "menu"
    selector = "li"
  end
  page.should have_selector(selector, :text => content)
end