version = '###VERSION###'

source = '###SOURCE###'

Pod::Spec.new do |s|
  s.name                      = 'RNPrebuilt'
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
