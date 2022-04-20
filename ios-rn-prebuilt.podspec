# This version is used in build_xcframwork.sh. So the format will have to be:
# version<space>=<space>doublequote<version_number>doublequote
version = "1.0.3" 
source = "https://github.com/traveloka/ios-rn-prebuilt/releases/download/#{version}/ios-rn-prebuilt.tar.gz"

Pod::Spec.new do |s|
  s.name                   = "ios-rn-prebuilt"
  s.version                = "#{version}"
  s.summary                = "React Native prebuilt xcframeworks for iOS"
  s.description            = <<-DESC
                               React Native prebuilt xcframeworks for iOS
                             DESC
  s.homepage               = "https://github.com/traveloka/ios-rn-prebuilt"
  s.author                 = "Traveloka"
  s.license                = 'MIT'
  s.platforms              = { :ios => "13.0" }
  s.source                 = { :http => source }
  s.framework              = "JavaScriptCore", "AudioToolbox"
  s.libraries              = 'stdc++'
  s.vendored_frameworks    = '**/*.xcframework'
  s.resources              = '**/*.bundle'
end
