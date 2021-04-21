Koala.configure do |config|
    config.app_id = ENV["MY_APP_ID"]
    config.app_secret = ENV["MY_APP_SECRET"]
    # See Koala::Configuration for more options, including details on how to send requests through
    # your own proxy servers.
  end