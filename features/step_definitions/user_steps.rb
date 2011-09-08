Given /^I have already signed up$/ do
  @last_user = FactoryGirl.create(:user)
end

Given /^I have already signed up as "([^"]*)"$/ do |login|
  if login.match(/@/)
    @last_user = FactoryGirl.create(:user, :email => login)
  else
    @last_user = FactoryGirl.create(:user, :username => login)
  end
end
