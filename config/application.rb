require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DemoRails6
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    # my config ---------------------------------------------------------------
    config.time_zone = 'Asia/Bangkok'
    config.active_record.default_timezone = :utc
    config.encoding = 'utf-8'
    config.generators do |g|
      g.template_engine :slim
    end    

    config.autoload_paths += Dir.glob("#{config.root}/app/interactions/*")
    config.active_storage.variant_processor = :vips
  end
end

module MyI8n
  LOCALES = %w[vi en].freeze

  class Application < Rails::Application
    config.i18n.available_locales = MyI8n::LOCALES
    config.i18n.locale = :vi
    config.i18n.default_locale = :vi
    # config.i18n.fallbacks = (['vi'] + MyI8n::LOCALES).uniq
  end
end