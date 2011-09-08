FactoryGirl.define do

  sequence :username do |n|
    "user#{n}"
  end

  factory :user do
    username              { Factory.next(:username) }
    email                 { Forgery(:internet).email_address }
    password              'password'
    password_confirmation 'password'
  end

end
