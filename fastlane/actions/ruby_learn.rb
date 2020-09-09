module Fastlane
  module Actions
    module SharedValues
      RUBY_LEARN_CUSTOM_VALUE = :RUBY_LEARN_CUSTOM_VALUE
    end

    class RubyLearnAction < Action
      def self.run(params)
        # 最终要执行的东西，在这里执行

        # 1、获取所有输入的参数
        # tag 的名称 如 0.1.0
        tageName = params[:tag]
        # 是否需要删除本地标签
        isRemoveLocationTag = params[:isRL]
        # 是否需要删除远程标签
        isRemoveRemoteTag = params[:isRR]

        # 2、定义一个数组，准备往数组里面添加相应的命令
        cmds = []

        # 删除本地的标签
        # git tag -d 标签名称
        if isRemoveLocationTag
          cmds << "git tag -d #{tageName}"
        end

        # 删除远程标签
        # git push origin :标签名称
        if isRemoveRemoteTag
          cmds << "git push origin :#{tageName}"
        end

        # 3、执行数组里面的所有的命令
        result = Actions.sh(cmds.join('&'))
        UI.message("执行完毕 remove_tag的操作 🚀")
        return result

      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "A short description with <= 80 characters of what this action does"
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

            # 传入tag值的参数描述，不可以忽略<必须输入>，字符串类型，没有默认值
            FastlaneCore::ConfigItem.new(key: :tag,
                                         description: "tag 号是多少",
                                         optional:false,# 是不是可以省略
                                         is_string: true, # true: 是不是字符串
                                         ),
            # 是否删除本地标签
            FastlaneCore::ConfigItem.new(key: :isRL,
                                         description: "是否删除本地标签",
                                         optional:true,# 是不是可以省略
                                         is_string: false, # true: 是不是字符串
                                         default_value: true), # 默认值是啥

            # 是否删除远程标签
            FastlaneCore::ConfigItem.new(key: :isRR,
                                         description: "是否删除远程标签",
                                         optional:true,# 是不是可以省略
                                         is_string: false, # true: 是不是字符串
                                         default_value: true) # 默认值是啥
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['RUBY_LEARN_CUSTOM_VALUE', 'A description of what this value contains']
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
