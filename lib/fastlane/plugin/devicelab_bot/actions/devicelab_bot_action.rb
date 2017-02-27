require 'rest-client'
require 'rufus-scheduler'
require 'JSON'

module Fastlane
  module Actions
    class DevicelabBotAction < Action
      def self.run(params)
        Helper::AppInstaller.new(
          params[:base_url],
          params[:app_name],
        ).install()
      end

      def self.description
        "Automatically install your app on your devicelab with the devicelab bot"
      end

      def self.authors
        ["Almouro"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Automatically install your app on your devicelab with the devicelab bot"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :base_url,
            env_name: "DEVICELAB_BOT_BASE_URL",
            description: "Base url for your devicelab bot",
            optional: false,
            type: String,
          ),
          FastlaneCore::ConfigItem.new(
            key: :app_name,
            env_name: "DEVICELAB_BOT_APP_NAME",
            description: "Base url for your devicelab bot",
            optional: false,
            type: String,
            default_value: ENV['IOS_APP_NAME'],
          ),
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
