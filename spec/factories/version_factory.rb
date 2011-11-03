FactoryGirl.define do

  factory :version, :class => "VendorForge::Version" do
    number      "0.1"
    association :vendor
  end

end
