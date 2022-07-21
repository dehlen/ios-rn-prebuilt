# RNPrebuilt

Pre-built React Native xcframeworks to save the time of humans.

Features:

- iOS and Mac Catalyst are both supported with xcframeworks.
- Easy integration without messy Podfile.

Inspired by <https://github.com/traveloka/ios-rn-prebuilt>.

## Get Started

### Installation

#### CocoaPods

```rb
pod 'RNPrebuilt', configuration: 'Release'
pod 'RNPrebuilt-Debug', configuration: 'Debug' # loading debug support
```

#### Swift Package

(working in progress)

### Code Snippet

```swift
import React
import UIKit

public class ReactNativeBaseVC: UIViewController {
  private enum Constants {
    static let moduleName = "[ModuleName]"
  }

  private lazy var rootView: UIView = RCTAppSetupDefaultRootView(self.bridge, Constants.moduleName, [:])
  private lazy var bridge = RCTBridge(delegate: self, launchOptions: [:])

  override public func viewDidLoad() {
    super.viewDidLoad()

    rootView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(rootView)

    NSLayoutConstraint.activate([
      rootView.topAnchor.constraint(equalTo: view.topAnchor),
      rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      rootView.leftAnchor.constraint(equalTo: view.leftAnchor),
      rootView.rightAnchor.constraint(equalTo: view.rightAnchor),
    ])
  }
}

extension ReactNativeBaseVC: RCTBridgeDelegate {
  public func sourceURL(for _: RCTBridge!) -> URL! {
    URL(string: "http://localhost:8081/index.bundle?platform=ios")! // or your local JavaScript bundle file
  }

  public func extraModules(for _: RCTBridge!) -> [RCTBridgeModule]! {
    [
      RCTDevSettings(),
      RCTAsyncLocalStorage(),
      RCTRedBox(),
    ]
  }
}


```

## Development

## Integration Test
There is a sample app to test integrating the resulting xcframework in an app. 

### Start Metro Bundler
Start the metro bundler via `cd frontend && yarn start`

### Install Cocoapods
Run `cd IntegrationTest/ios && pod install` to install the xcframework. In the future a SPM version will be available too.

### Run app
Open `IntegrationTest/ios/ios.xcworkspace` and run the application. You should see a debug RN screen.

## Release Plan

We're using release branches `releases/[react_native_version]` to track the official release of React Native.
A new version of this xcframework is build via GitHub workflows on every push on such a branch (releases/<any_name>).
For this to work the repository needs to set a couple of secrets.

(working in progress)

## License

MIT
