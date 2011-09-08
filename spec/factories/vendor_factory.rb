FactoryGirl.define do

  sequence :vendor_name do |n|
    "vendor#{n}"
  end

  factory :vendor do
    name        { Factory.next(:vendor_name) }
    association :user
  end

end
