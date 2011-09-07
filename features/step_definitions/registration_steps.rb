When /^I register successfully$/ do
  user = FactoryGirl.attributes_for(:user)

  visit path_to('the registration page')

  fill_in("Email", :with => user[:email])
  fill_in("Password", :with => user[:password])
  fill_in("Confirmation", :with => user[:password_confirmation])

  click_button("Sign up")
end

When /^I register unsuccessfully$/ do
  visit path_to('the registration page')

  click_button("Sign up")
end

Then /^I should see the registration form$/ do
  page.has_css? selector_for("the registration form")
end
