module ShopSync
  class Authentication

    class << self
      def authenticated?(store)
        File.exist?(get_store_env_path(store))
      end

      def auth_store(store, key, password, host)
        clear(store) if File.exist?(get_store_env_path(store))

        File.open(get_store_env_path(store), "w") do |f|
          f.write("API_KEY=#{key}\n")
          f.write("API_PASSWORD=#{password}\n")
          f.write("API_HOST=#{host}\n")
        end
      end

      def get(store)
        auth = {}
        File.open(get_store_env_path(store), "r") do |f|
          auth[:key]      = f.gets.split('=')[1].strip!
          auth[:password] = f.gets.split('=')[1].strip!
          auth[:host]     = f.gets.split('=')[1].strip!
        end
        auth
      end

      def clear(store)
        File.unlink(get_store_env_path(store)) if File.exist?(get_store_env_path(store))
      end

      def get_store_env_path(store)
        File.join(Dir.home, "#{store}.env")
      end
    end

  end
end
