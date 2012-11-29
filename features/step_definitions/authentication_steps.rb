When /^I a?m? ?(not )?authenticated?( as (.+) \/\/ (.+))?$/ do |status, unused, username, password|
  unless status == "not "
    if username == "admin"
      @current_user = FactoryGirl.create(:admin, :username => username, :password => password)
    else
      @current_user = FactoryGirl.create(:user, :username => username, :password => password)
    end

    visit new_user_session_path

    fill_in "user_username", :with => username
    fill_in "user_password", :with => password

    click_button I18n::t('devise.sessions.new.sign_in')
  end
end

When /^I authenticate with wrong data$/ do
  fill_in "user_username", :with => "wrong"
  fill_in "user_password", :with => "userdata"

  click_button I18n::t('devise.sessions.new.sign_in')
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