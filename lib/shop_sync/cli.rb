require 'thor'
require 'fileutils'
require 'shopify_api'

module ShopSync
  class CLI < Thor

    desc "config STORE", "Generate a configuration file for the Shopify store named STORE"
    def config store
      key = ask("What is your API key?\n", :echo => false).strip
      password = ask("What is your API password?\n", :echo => false).strip
      host = ask("What is your API host?\n").strip

      [key, password, host].each do |option|
        if option.to_s.empty?
          say("Invalid option. Please try again.")
          return
        end
      end

      file = Authentication.auth_store(store, key, password, host)

      say("Your config file is available at #{Authentication.get_store_env_path(store)}")
    end

    desc "logout STORE", "Remove authenticated credentials for the specified store"
    def logout(store)
      Authentication.clear(store)
    end

    desc "download STORE", "Download the theme assets into the current directory for the configured STORE"
    def download store
      unless Authentication.authenticated?(store)
        puts "Either the store doesn't exist or you haven't authenticated"
      else
        auths = Authentication.get(store)
      end

      shop_url = "https://#{auths[:key]}:#{auths[:password]}@#{auths[:host]}/admin"

      ShopifyAPI::Base.site = shop_url
      assets = ShopifyAPI::Asset.all
      assets.each do |asset|
        puts asset.public_url  
      end
    end

    desc "replace STORE", "Replace the theme assets from the current directory to the configured STORE"
    def replace store

    end

    desc "watch STORE", "Automatically upload modified theme assets to the configured STORE"
    def watch store

    end

    desc "copy SOURCE_STORE DESTINATION_STORES...", "Replaces one or more of the destination store's themes with the source store's theme"
    def copy(source_store, *destination_stores)

    end

  end
end
