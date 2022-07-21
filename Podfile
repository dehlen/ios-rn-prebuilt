ios_deployment_target = '14.0'

require_relative './node_modules/react-native/scripts/react_native_pods.rb'

source 'https://cdn.cocoapods.org/'

platform :ios, ios_deployment_target
inhibit_all_warnings!
use_frameworks! :linkage => :static

# 3rd party dependencies
react_native_device_info = 'v8.7.0'
react_native_gesture_handler_tag = '1.10.3'
react_native_sentry = '2.1.0'
react_native_svg_tag = 'v12.3.0'

target 'ios-rn-prebuilt' do
  ENV['DISABLE_CODEGEN'] = '1'

  flags = get_default_flags()
  
  use_react_native!(
    :path => "./node_modules/react-native",
    :hermes_enabled => true,
    :fabric_enabled => flags[:fabric_enabled],
    :app_path => "#{Pod::Config.instance.installation_root}"
  )

  # 3rd party dependencies
  pod 'RNDeviceInfo', :git => "git@github.com:react-native-device-info/react-native-device-info.git", :tag => react_native_device_info, :modular_headers => false
  pod 'RNGestureHandler', :git => "git@github.com:software-mansion/react-native-gesture-handler.git", :tag => react_native_gesture_handler_tag, :modular_headers => false
  pod 'RNSentry', :git => "git@github.com:getsentry/sentry-react-native.git", :tag => react_native_sentry, :modular_headers => false
  pod 'RNSVG', :git => "git@github.com:react-native-community/react-native-svg", :tag => react_native_svg_tag, :modular_headers => false
end

post_install do |installer|
  puts "#{Pod::Config.instance.installation_root}/.."
  react_native_post_install(installer)
  __apply_Xcode_12_5_M1_post_install_workaround(installer)
  fix_folly_header_search_paths(installer)
end

def fix_folly_header_search_paths(installer)
  # https://github.com/facebook/react-native/issues/32451
  installer.pods_project.targets.each do |target|
    if target.name == 'RCT-Folly'
      target.build_configurations.each do |config|
        config.build_settings['HEADER_SEARCH_PATHS'] = "$(inherited) ${PODS_ROOT}/fmt/include"
      end
    end
  end
end
