require 'spec_helper'

describe NotifierObserver do

  describe "#after_create" do

    it "should queue a resque task to tweet" do
      version = Factory.create(:version)
      NotifierObserver.instance.after_create(version)

      TwitterUpdater.should have_queued(version.id)
    end

  end

end
