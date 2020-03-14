
require_relative 'boot'

require 'rails/all'



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Travelpin
  class Application < Rails::Application
    

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options, :put, :delete, :patch]
      end
    end
# Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.serve_static_assets = true
    config.assets.compile = true
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "poppins")
    config.assets.paths << Rails.root.join("app", "assets", "images")
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    
  end
end
