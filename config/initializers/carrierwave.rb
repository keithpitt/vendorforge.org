CarrierWave.configure do |config|

  # Use local file storage for tests
  if Rails.env.test? or Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
  else
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_KEY'],
      :aws_secret_access_key  => ENV['S3_SECRET'],
      :region                 => 'us-east-1'
    }
    config.fog_directory      = "vendorforge-#{Rails.env}"
    config.cache_dir          = "#{Rails.root}/tmp/uploads"
  end

end
