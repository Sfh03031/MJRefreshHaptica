#
# Be sure to run `pod lib lint MJRefreshHaptica.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MJRefreshHaptica'
  s.version          = '0.1.0'
  s.summary          = 'Add haptica feed back during pulling to refresh for MJRefresh by runtime.(利用runtime为MJRefresh添加下拉刷新过程中的触觉反馈效果。)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add haptica feed back during pulling to refresh for MJRefresh by runtime.(利用runtime为MJRefresh添加下拉刷新过程中的触觉反馈效果。)
                       DESC

  s.homepage         = 'https://github.com/Sfh03031/MJRefreshHaptica'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sfh03031' => 'sfh894645252@163.com' }
  s.source           = { :git => 'https://github.com/Sfh03031/MJRefreshHaptica.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_versions   = '5.0'
  s.ios.deployment_target = '13.0'

  s.source_files = 'MJRefreshHaptica/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MJRefreshHaptica' => ['MJRefreshHaptica/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'MJRefresh'
  s.dependency 'Haptica'
  
end
