
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
Avoid(NSMutableArray、NSMutableDictionary、UIComponent etc.) nil Exception
                       DESC

  s.homepage         = 'https://github.com/jiachenmu/MBNullSafe.git'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ManoBoo’ => ‘jiachenmu@qq.com’ }
  s.source           = { :git => 'https://github.com/jiachenmu/MBNullSafe.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MBNullSafe/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'

end
