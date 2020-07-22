module Fastlane
  module Actions
    module SharedValues
      POD_CUSTOM_VALUE = :POD_CUSTOM_VALUE
    end

    class PodAction < Action
      def self.run(params)
        # fastlane will take care of reading in the parameter and fetching the environment variable:
        #UI.message "Parameter API Token: #{params[:api_token]}"

        # sh "shellcommand ./path"

        # Actions.lane_context[SharedValues::POD_CUSTOM_VALUE] = "my_val"
        #
        # repo = "--no-repo-update"
        command = []
        # command << "pod install"
        # if params[:repo_update]
        #   repo = "--repo-update"
        # end
        # command << repo
        # if params[:verbose]
        #   command << "--verbose"
        # end
        #
        #  command << "cocoapods(clean: true, podfile: './Example/Podfile' )"
        puts  params[:repo_update]
        # result = Actions.sh(command.join(' '))
        # UI.success(command.join(' ') + " Successfully ")
        # return result
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "pod install action"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "verbose / repo-update"
      end

      def self.available_options
        # Define all options your action supports.

        [
            FastlaneCore::ConfigItem.new(key: :verbose,
                                         description: "Allow output detail in console",
                                         optional: true,
                                         is_string: false,
                                         default_value: false),
            FastlaneCore::ConfigItem.new(key: :repo_update,
                                         description: "Allow output detail in console",
                                         optional: true,
                                         is_string: false,
                                         default_value: false)
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['POD_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["Your GitHub/Twitter Name"]
      end

      def self.is_supported?(platform)
        # you can do things like
        #
        #  true
        #
        #  platform == :ios
        #
        #  [:ios, :mac].include?(platform)
        #

        platform == :ios
      end
    end
  end
end
