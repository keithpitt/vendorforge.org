FactoryGirl.define do

  factory :user do
    email                 { Forgery(:internet).email_address }
    password              'password'
    password_confirmation 'password'
  end

end
