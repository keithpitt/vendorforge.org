When /^I logout successfully$/ do
  click_link "Logout"
end

When /^I login successfully$/ do
  When %{I login with "#{@last_user.email}" and "password"}
end

When /^I login unsuccessfully$/ do
  When %{I login with "#{@last_user.email}" and "incorrect-password"}
end

When /^I login with "([^"]*)" and "([^"]*)"$/ do |login, password|
  visit path_to('the login page')
  fill_in("Login", :with => login)
  fill_in("Password", :with => password)
  click_button("Sign in")
end

When /^I have already logged in$/ do
  Given %{I have already logged in as "#{FactoryGirl.attributes_for(:user)[:email]}"}
end

When /^I have already logged in as "([^"]*)"$/ do |login|
  Given %{I have already signed up as "#{login}"}
  And %{I login successfully}
end

Then /^I should be logged in$/ do
  page.should have_content("Logout")
end

Then /^I should not be logged in$/ do
  page.should_not have_content("Logout")
end
