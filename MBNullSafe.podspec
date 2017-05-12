#h
# Be sure to run `pod lib lint MBNullSafe.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MBNullSafe'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MBNullSafe.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
				避免常用操作(NSMutableArray、NSMutableDictionary、UI控件等)造成的 Nil 崩溃
                       DESC

  s.homepage         = 'https://github.com/jiachenmu/MBNullSafe.git’
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { ‘manoboo’ => ‘manoboo@icloud.com’ }
  s.source           = { :git => 'https://github.com/jiachenmu/MBNullSafe.git', :tag => s.version.to_s }
  # s.social_media_url = 'http://www.jianshu.com/u/232094594d02'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MBNullSafe/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MBNullSafe' => ['MBNullSafe/Assets/*.png']
  # }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
