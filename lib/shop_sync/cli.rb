require 'thor'

module ShopSync
  class CLI < Thor

    desc "config STORE", "Generate a configuration file for the Shopify store named STORE"
    def config store

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
