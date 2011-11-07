class TwitterUpdater

  @queue = :twitter_updater

  require 'shrinker'

  def self.perform(version_id)
    version = VendorForge::Version.find(version_id)
    vendor = version.vendor

    vendor_url = Rails.application.routes.url_helpers.vendor_url(vendor, :host => "vendorforge.org")
    start = "#{vendor.name} (#{version.number}): #{Shrinker.shrink(vendor_url)} "
    dots = '...'

    # Need to take a few extra characters to count for twitters shortening service
    remaining = 140 - start.length - 3

    description = if vendor.description
                    if (vendor.description.length - dots.length) > remaining
                      vendor.description[0, remaining - dots.length].strip + dots
                    else
                      vendor.description
                    end
                  else
                    ""
                  end

    tweet = start + description

    Rails.logger.debug "TWEETING: #{tweet}"
    Twitter.update(tweet)

    tweet
  end

end
