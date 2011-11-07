class NotifierObserver < ActiveRecord::Observer

  observe VendorForge::Version

  def after_create(version)
    Resque.enqueue(TwitterUpdater, version.id)
  end

end
