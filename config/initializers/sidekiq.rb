Sidekiq.configure_server do |config|
  config.redis = { namespace: "ft2db_#{Rails.env}" }
  config.error_handlers << lambda do |exception, context|
    Airbrake.notify_or_ignore(exception, parameters: context)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: "ft2db_#{Rails.env}" }
end
