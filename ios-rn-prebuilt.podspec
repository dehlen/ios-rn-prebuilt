# This version is used in build_xcframwork.sh. So the format will have to be:
# version<space>=<space>doublequote<version_number>doublequote
version = "1.0.5" 
source = "https://github.com/traveloka/ios-rn-prebuilt/releases/download/#{version}/ios-rn-prebuilt.tar.gz"

Pod::Spec.new do |s|
  s.name                      = "ios-rn-prebuilt"
  s.version                   = "#{version}"
  s.summary                   = "React Native prebuilt xcframeworks for iOS"
  s.description               = <<-DESC
                                   React Native prebuilt xcframeworks for iOS
                                 DESC
  s.homepage                  = "https://github.com/traveloka/ios-rn-prebuilt"
  s.author                    = "Traveloka"
  s.license                   = 'MIT'
  s.platforms                 = { :ios => "13.0" }
  s.source                    = { :http => source }
  s.framework                 = "JavaScriptCore", "AudioToolbox"
  s.libraries                 = 'stdc++'

  s.subspec 'yoga' do |yoga|
    yoga.vendored_frameworks     = '**/yoga.xcframework'
  end

  s.subspec 'main' do |main|
    main.vendored_frameworks  = '**/*.xcframework'
    main.resources            = '**/*.bundle'

    main.dependency             'ios-rn-prebuilt/yoga'
  end

  s.default_subspecs          = 'main'

  # Excluded dependencies
  s.dependency                  'PINCache'
  s.dependency                  'PINRemoteImage'
  s.dependency                  'PINOperation'
end
