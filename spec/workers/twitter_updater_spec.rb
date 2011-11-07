require 'spec_helper'

describe TwitterUpdater do

  describe '#perform' do

    let(:version) { Factory.create(:version, :number => "1.0.2") }
    let(:vendor)  { version.vendor }

    before :each do
      Shrinker.stub(:shrink).and_return "http://is.short"

      Twitter.stub(:update)
    end

    it "should update twitter" do
      TwitterUpdater.perform(version.id)
    end

    it "should include the shortened url" do
      tweet = TwitterUpdater.perform(version.id)
      tweet.should include("http://is.short")
    end

    it "should include the description and the name" do
      vendor.name = "Good Lib"
      vendor.description = "It's great!"
      vendor.save

      tweet = TwitterUpdater.perform(version.id)
      tweet.should include("Good Lib (1.0.2): http://is.short It's great!")
    end

    it "should shorten descriptions" do
      vendor.name = "Good Lib"
      vendor.description = "It's great and stuff, I really think you should try it and be merry. While your there, be awesome for me, thanks man!"
      vendor.save
      Twitter.should_receive(:update).with("Good Lib (1.0.2): http://is.short It's great and stuff, I really think you should try it and be merry. While your there, be awesome fo...")

      TwitterUpdater.perform(version.id)
    end

    it "should still have 140 characters if the shortened url is long" do
      Shrinker.stub(:shrink).and_return "http://is.short/but/its/actually/quite/long"
      vendor.name = "Good Lib"
      vendor.description = "It's great and stuff, I really think you should try it and be merry. While your there, be awesome for me, thanks man!"
      vendor.save
      Twitter.should_receive(:update).with("Good Lib (1.0.2): http://is.short/but/its/actually/quite/long It's great and stuff, I really think you should try it and be merry. Whi...")

      TwitterUpdater.perform(version.id)
    end

  end

end
