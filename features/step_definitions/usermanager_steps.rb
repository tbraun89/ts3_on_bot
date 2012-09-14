Then /^I should get an access denialed error$/ do
  page.should have_selector('div', :text => I18n::t('cancan.access_denied'))
end

When /^I have (\d+) users? in the database$/ do |user_count|
  @created_users = []

  (1..user_count.to_i).each do
    @created_users << FactoryGirl.create(:user)
  end
end

Then /^I want to see all users in the list$/ do
  page.should have_selector('td', :text => @current_user.username)

  @created_users.each do |current|
    page.should have_selector('td', :text => current.username)
  end
end

When /^I add a new user with (.+) \/\/ (.+) \/\/ (.+)$/ do |username, password, email|
  fill_in "user_username",              :with => username
  fill_in "user_password",              :with => password
  fill_in "user_password_confirmation", :with => password
  fill_in "user_email",                 :with => email

  click_button "Save"
end

Then /^I (don't )?want to see the user (.+) in the list$/ do |negative, username|
  if negative == "don't "
    page.should have_no_selector('td', :text => username)
  else
    page.should have_selector('td', :text => username)
  end
end

When /^change the username to (.+)$/ do |username|
  fill_in "user_username", :with => username

  click_button "Save"
end

When /^I delete user (\d+)$/ do |id|
  click_link "delete_#{id}"
end