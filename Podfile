require_relative '../node_modules/react-native/scripts/react_native_pods.rb'

source 'git@github.com:traveloka/Specs.git'
source 'https://cdn.cocoapods.org/'

platform :ios, '13.0'
inhibit_all_warnings!
use_frameworks! :linkage => :static

# 3rd party dependencies
code_push_tag = 'splits/v7.0.1-3'
react_native_async_storage_tag = 'v1.15.4'
react_native_datetimepicker_tag = 'v3.4.7'
react_native_geolocation_tag = 'v1.4.2'
react_native_gesture_handler_tag = '1.10.3'
react_native_netinfo_tag = 'v6.0.0'
react_native_maps_tag = 'v0.25.0'
react_native_masked_view_tag = 'v0.1.11'
react_native_reanimated_tag = '2.1.0'
react_native_safe_area_context_tag = 'v3.2.0'
react_native_screens_tag = '3.1.1-2'
react_native_svg_tag = 'v9.3.3'
react_native_pager_view_tag = 'v5.2.1'
react_native_webview_tag = 'v7.5.2'

target 'ios-rn-prebuilt' do
  ENV['DISABLE_CODEGEN'] = '1'
  
  use_react_native!(
    :path => "../node_modules/react-native"
  )

  # 3rd party dependencies
  pod 'CodePush', :git => "git@github.com:traveloka/react-native-code-push.git", :tag => code_push_tag
  pod 'RNCAsyncStorage', :git => 'git@github.com:react-native-async-storage/async-storage.git', :tag => react_native_async_storage_tag
  pod 'RNDateTimePicker', :git => 'git@github.com:react-native-datetimepicker/datetimepicker.git', :tag => react_native_datetimepicker_tag
  pod 'react-native-fast-image', :git => "git@github.com:traveloka/react-native-fast-image.git", branch: 'master', commit: 'cd68721e6ba450670db40867990c781814b5766c', :modular_headers => false
  pod 'react-native-geolocation', :git => "git@github.com:react-native-community/react-native-geolocation.git", :tag => react_native_geolocation_tag, :modular_headers => false
  pod 'RNGestureHandler', :git => "git@github.com:software-mansion/react-native-gesture-handler.git", :tag => react_native_gesture_handler_tag, :modular_headers => false
  pod 'react-native-netinfo', :git => "git@github.com:react-native-community/react-native-netinfo.git", :tag => react_native_netinfo_tag, :modular_headers => false
  pod 'react-native-maps', :git => "git@github.com:react-native-community/react-native-maps.git", :tag => react_native_maps_tag, :modular_headers => false
  pod 'RNCMaskedView', :git => 'git@github.com:react-native-masked-view/masked-view.git', :tag => react_native_masked_view_tag
  pod 'RNReanimated', :git => "git@github.com:software-mansion/react-native-reanimated.git", :tag => react_native_reanimated_tag, :modular_headers => false
  pod 'react-native-safe-area-context', :git => 'git@github.com:th3rdwave/react-native-safe-area-context.git', :tag => react_native_safe_area_context_tag
  pod 'RNScreens', :git => 'git@github.com:traveloka/react-native-screens.git', :tag => react_native_screens_tag
  pod 'RNSVG', :git => "git@github.com:react-native-community/react-native-svg", :tag => react_native_svg_tag, :modular_headers => false
  pod 'react-native-pager-view', :git => "git@github.com:callstack/react-native-pager-view.git", :tag => react_native_pager_view_tag, :modular_headers => false
  pod 'react-native-webview', :git => "git@github.com:react-native-community/react-native-webview.git", :tag => react_native_webview_tag

end
