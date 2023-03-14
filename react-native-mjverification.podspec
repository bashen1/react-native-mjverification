require 'json'
pjson = JSON.parse(File.read('package.json'))

Pod::Spec.new do |s|

  s.name            = pjson['name']
  s.version         = pjson["version"]
  s.homepage        = pjson["homepage"]
  s.summary         = pjson["description"]
  s.license         = pjson["license"]
  s.author          = pjson["author"]
  
  s.ios.deployment_target = '8.0'

  s.source          = { :git => "https://github.com/bashen1/react-native-mjverification.git", :tag => "#{s.version}" }
  s.source_files    = 'ios/RCTJVerificationModule/*.{h,m}'
  s.preserve_paths  = "*.js"
  s.frameworks      = 'UIKit','CFNetwork','CoreFoundation','CoreTelephony','SystemConfiguration','CoreGraphics','Foundation','Security', 'AdSupport', 'CoreLocation','NetworkExtension', 'MobileCoreServices'
  s.libraries       = 'z','resolv', 'sqlite3', 'c++.1'
  s.vendored_libraries = "ios/RCTJVerificationModule/*.a"
  s.vendored_frameworks = "ios/RCTJVerificationModule/*.framework"
  s.dependency 'React'
  s.dependency 'JVerification', '2.9.4'
end
