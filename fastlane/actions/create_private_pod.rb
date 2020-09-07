module Fastlane
  module Actions
    module SharedValues
      CREATE_PRIVATE_POD_CUSTOM_VALUE = :CREATE_PRIVATE_POD_CUSTOM_VALUE
    end

    class CreatePrivatePodAction < Action
      def self.run(params)
        # fastlane will take care of reading in the parameter and fetching the environment variable:
        podName = params[:podName]
        podUrl = params[:podUrl]

        system "pod lib create #{podName} '--template-url=https://gitlab.btpoc.com/app/ios/componenttemplate.git' "
        # Actions.sh("pod", "lib", "create", podName , "--template-url=http://gitlab.gwm.com.cn/xuemingyang/privatepod.git")
        Dir.chdir(podName) do
        system "git remote add origin #{podUrl}"
        end


        # pod lib create podName --template-url=http://gitlab.gwm.com.cn/xuemingyang/privatepod.git

        # sh "shellcommand ./path"

        # Actions.lane_context[SharedValues::CREATE_PRIVATE_POD_CUSTOM_VALUE] = "my_val"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "创建一个私有库"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "You can use this action to do cool things..."
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :podName,
                                       description: "podName", # a short description of this parameter
                                       is_string: true
                                       ),
          FastlaneCore::ConfigItem.new(key: :podUrl,
                                       description: "podUrl", # a short description of this parameter
                                       is_string: true
                                       ),
          
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['CREATE_PRIVATE_POD_CUSTOM_VALUE', 'A description of what this value contains']
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
