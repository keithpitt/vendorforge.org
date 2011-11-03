FactoryGirl.define do

  sequence :vendor_name do |n|
    "vendor#{n}"
  end

  factory :vendor, :class => "VendorForge::Vendor" do
    name        { Factory.next(:vendor_name) }
    association :user

    after_build do |vendor|
      vendor.versions.build :user => vendor.user, :number => "0.1"
    end
  end

end
