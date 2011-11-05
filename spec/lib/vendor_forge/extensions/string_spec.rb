require 'spec_helper'

describe VendorForge::Extensions::String do

  describe "#slugerize" do

    it "should replace spaces with -" do
      "hello there".slugerize.should == "hello-there"
    end

    it "should replace non alpha-numeric characters with a -" do
      "# a % b ( c ) d      e".slugerize.should == "-a-b-c-d-e"
    end

  end

end
