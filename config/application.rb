require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Socify
  class Application < Rails::Application
    config.i18n.available_locales = [:en, :da]
    config.i18n.default_locale = :da
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
