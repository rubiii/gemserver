require "yaml"

module Server
  class Config
    class << self

      # Relative path to the config file.
      ConfigFile = "config/config.yml"

      # Returns a +key+ from the config.
      def [](key)
        config[key.to_s] || config[key.to_sym]
      end

    private

      # Returns the config.
      def config
        @config ||= YAML.load File.read(config_file)
      end

      # Returns the full path to the config file.
      def config_file
        File.join AppRoot, ConfigFile
      end

    end
  end
end