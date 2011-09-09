FactoryGirl.define do

  factory :version do
    number      "0.1"
    association :vendor
  end

end
