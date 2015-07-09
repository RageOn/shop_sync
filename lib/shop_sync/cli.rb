require 'thor'
require 'fileutils'

module ShopSync
  class CLI < Thor

    desc "config STORE", "Generate a configuration file for the Shopify store named STORE"
    def config store
      api_key = ask("What is your API key?\n", :echo => false)
      api_password = ask("What is your API password?\n", :echo => false)
      api_host = ask("What is your API host?\n")

      api_options = Array.new
      [api_key, api_password, api_host].each do |config_option|
        no_whitespace = config_option.strip
        if no_whitespace.empty?
          say("Invalid option. Please try again.")
          return
        end
        api_options.push(no_whitespace)
      end

      config_file = File.new("#{store}"+".env", "w")
      config_file.write("API_KEY=#{api_options[0]}\n")
      config_file.write("API_PASSWORD=#{api_options[1]}\n")
      config_file.write("API_HOST=#{api_options[2]}\n")
      say("Your config file is available at #{config_file.path}")
    end

    desc "download STORE", "Download the theme assets into the current directory for the configured STORE"
    def download store

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
