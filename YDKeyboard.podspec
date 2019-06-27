Pod::Spec.new do |s|
  s.name     = 'YDKeyboard'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'A delightful iOS YDKeyboard framework.'
  s.homepage = 'https://github.com/wangyund/YDKeyboard'
  s.platform = :ios
  s.social_media_url = 'https://github.com/wangyund'
  s.authors  = { 'wangyund' => 'wuyezhiguhun@163.com' }
  s.ios.deployment_target = '8.0'
  s.source   = { :git => 'https://github.com/wangyund/YDKeyboard.git', :tag => s.version, :submodules => true }
  s.requires_arc = true
  
  s.public_header_files = 'YDKeyboard/YDKeyboard/Header/*.{h}'
  s.source_files = 'YDKeyboard/YDKeyboard/Header/*.{h,m}'
  s.resources = 'YDKeyboard/YDKeyboard/Resources/YDKeyboard.bundle'
  s.frameworks = 'UIKit','Foundation'


  s.subspec 'Foundation' do |ss|
     ss.public_header_files = 'YDKeyboard/YDKeyboard/Foundation/*.{h}'
     ss.source_files = 'YDKeyboard/YDKeyboard/Foundation/*.{h,m}'
  end

  s.subspec 'Extension' do |ss|
     ss.public_header_files = 'YDKeyboard/YDKeyboard/Extension/*.{h}'
     ss.source_files = 'YDKeyboard/YDKeyboard/Extension/*.{h,m}'
  end

  s.subspec 'ViewModel' do |ss|
     ss.public_header_files = 'YDKeyboard/YDKeyboard/ViewModel/*.{h}'
     ss.source_files = 'YDKeyboard/YDKeyboard/ViewModel/*.{h,m}'
  end

  s.subspec 'View' do |ss|
     ss.public_header_files = 'YDKeyboard/YDKeyboard/View/*.{h}'
     ss.source_files = 'YDKeyboard/YDKeyboard/View/*.{h,m}'
     s.resources = 'YDKeyboard/YDKeyboard/Resources/*.{png}'
  end


end
