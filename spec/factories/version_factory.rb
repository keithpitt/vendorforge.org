FactoryGirl.define do

  factory :version, :class => "VendorForge::Version" do
    number { "#{rand(9)}.#{rand(9)}.#{rand(9)}" }
    user
    vendor
  end

end
