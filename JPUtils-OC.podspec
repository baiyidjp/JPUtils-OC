
Pod::Spec.new do |s|

  s.name         = "JPUtils-OC"
  s.version      = "0.0.3"
  s.summary      = "Objective-C 常用的工具和方法"
  s.homepage     = "https://github.com/baiyidjp/JPUtils-OC"
  s.license      = "MIT"
  s.author             =  "baiyidjp"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/baiyidjp/JPUtils-OC.git", :tag => "#{s.version}" }
  s.source_files  = "JPUtils-OC/*.{h,m}"
  s.requires_arc = true
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  #Config
  s.subspec 'Config' do |ss|
  ss.source_files = "JPUtils-OC/Config/*.{h,m}"
  end

  #Date
  s.subspec 'Date' do |ss|
  ss.source_files = "JPUtils-OC/Date/*.{h,m}"
  ss.dependency 'JPUtils-OC/String'
  ss.dependency 'JPUtils-OC/Config'
  end

  #Layout
  s.subspec 'Layout' do |ss|
  ss.source_files = "JPUtils-OC/Layout/*.{h,m}"
  end

  #Route
  s.subspec 'Route' do |ss|
  ss.source_files = "JPUtils-OC/Route/*.{h,m}"
  ss.dependency 'JPUtils-OC/String'
  ss.dependency 'JPUtils-OC/View'
  ss.dependency 'JPCategory-OC/UIViewController'
  end

  #String
  s.subspec 'String' do |ss|
  ss.source_files = "JPUtils-OC/String/*.{h,m}"
  end

  #System
  s.subspec 'System' do |ss|
  ss.source_files = "JPUtils-OC/System/*.{h,m}"
  ss.dependency 'JPUtils-OC/String'
  end

  #Timer
  s.subspec 'Timer' do |ss|
  ss.source_files = "JPUtils-OC/Timer/*.{h,m}"
  end

  #View
  s.subspec 'View' do |ss|
  ss.source_files = "JPUtils-OC/View/*.{h,m}"
  end
# pod trunk push --allow-warnings --skip-import-validation

end
