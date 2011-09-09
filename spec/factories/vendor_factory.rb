FactoryGirl.define do

  sequence :vendor_name do |n|
    "vendor#{n}"
  end

  factory :vendor do
    name        { Factory.next(:vendor_name) }
    association :user

    after_build do |vendor|
      vendor.versions << Version.new(:user => vendor.user, :number => "0.1")
    end
  end

end
