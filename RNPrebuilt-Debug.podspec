version = '0.69.1'

source = 'https://github.com/dehlen/ios-rn-prebuilt/releases/download/v0.69.1/RNPrebuilt-v0.69.1-Debug.tar.gz'

Pod::Spec.new do |s|
  s.name                      = 'RNPrebuilt-Debug'
  s.version                   = version.to_s
  s.summary                   = 'React Native xcframeworks'
  s.description               = <<-DESC
                                   React Native prebuilt xcframeworks for iOS
  DESC
  s.homepage                  = 'https://github.com/dehlen/ios-rn-prebuilt'
  s.author                    = 'David v.Knobelsdorff'
  s.license                   = { type: 'MIT', file: 'LICENSE' }
  s.platforms                 = { ios: '12.4' }
  s.source                    = {
    http: source
  }
  s.framework                 = 'JavaScriptCore', 'AudioToolbox'
  s.libraries                 = 'stdc++'

  s.subspec 'main' do |main|
    main.vendored_frameworks  = '**/*.xcframework'
    main.resources            = '**/*.bundle'
  end

  s.default_subspecs = 'main'
end
