require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dailysmarty
  class Application < Rails::Application
    Raven.configure do |config|
      config.dsn = 'https://e127f0ccc70641d68c669dc74837847d:e4b2cbb5620246b7b3a5422acf54dbc7@sentry.io/159102'
    end

    config.active_record.raise_in_transactional_callbacks = true
  end
end
