CarrierWave.configure do |config|

  # Use local file storage for local dev
  unless Rails.env.production?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
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
