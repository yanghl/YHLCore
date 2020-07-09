#
# Be sure to run `pod lib lint YHLCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'YHLCore'
    s.version          = '0.1.0'
    s.summary          = 'A short description of YHLCore.'
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/yanghl/YHLCore.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'yanghonglei' => '272789124@qq.com' }
    s.source           = { :git => 'https://github.com/yanghl/YHLCore.git', :tag => s.version.to_s }
    s.swift_version = '5.0'
    s.ios.deployment_target = '10.0'
    s.frameworks = 'UIKit', 'Foundation'
    
    s.source_files = 'YHLCore/Classes/**/*'
    s.resource_bundles = {
        'YHLCore' => ['YHLCore/Assets/*{.xcassets,.bundle}', 'YHLCore/Classes/**/{*.storyboard,*.xib}']
    }
    
    s.dependency 'RxSwift'
#    s.dependency 'RxCocoa'
#    s.dependency 'SnapKit'
#    s.dependency 'Kingfisher'
#    s.dependency 'SwiftyUserDefaults'
#    s.dependency 'NVActivityIndicatorView'
#    s.dependency 'Toast-Swift'
#    s.dependency 'Moya'
#    s.dependency 'MoyaMapper'
#    s.dependency 'MoyaMapper/MMCache'
#    s.dependency 'SwiftyJSON'
#    s.dependency 'R.swift'
#    s.dependency 'KeychainAccess'
#    s.dependency 'HandyJSON'
#    s.dependency 'SwifterSwift'
#    s.dependency 'EmptyDataSet-Swift'
#    s.dependency 'CryptoSwift'
#    s.dependency 'SwiftyRSA'
#    s.dependency 'MJRefresh'
#    s.dependency 'IQKeyboardManagerSwift'
#    s.dependency 'UITableView+FDTemplateLayoutCell'
#    s.dependency 'SKPhotoBrowser'
#    s.dependency 'GPUImage'
#    s.dependency 'RZCarPlateNoTextField'
end
