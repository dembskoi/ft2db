Airbrake.configure do |config|
  config.api_key = 'cf1760db00fcb5ec9debbbb30ad01291'
  config.host    = 'montpan.com'
  config.port    = 9777
  config.secure  = config.port == 443
  config.ignore_only = []
end
