Pod::Spec.new do |s|
s.name = 'MBNullSafe'
s.version = '0.1.0'
s.summary = 'Avoid NSMutableArray etc. Nil Exception'
s.homepage = 'https://github.com/jiachenmu/MBNullSafe'
s.license = 'MIT'
s.author = {'Manoboo' => 'manoboo@icloud.com'}
s.source = { :git => 'https://github.com/jiachenmu/MBNullSafe.git', :tag => s.version.to_s }
s.ios.deployment_target = '8.0'
s.source_files = 'MBNullSafe/Classes/**/*'
end
