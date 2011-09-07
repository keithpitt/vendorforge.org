Given /^I have already signed up$/ do
  @last_user = FactoryGirl.create(:user)
end

Given /^I have already signed up as "([^"]*)"$/ do |email|
  @last_user = FactoryGirl.create(:user, :email => email)
end
