CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_Access_Key'],                        # required
    :aws_secret_access_key  => ENV['AWS_Secret_Key'],                        # required
  }
  config.fog_directory  = 'rantly1'                          # required
  config.fog_public     = false                                        # optional, defaults to true
end