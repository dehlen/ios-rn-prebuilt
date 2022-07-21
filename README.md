# ios-rn-prebuilt
iOS RN Prebuilt is a prebuilt xcframeworks that contains **public repositories of React Native and 3rd party libraries**.
The benefit of using prebuilt xcframeworks are:
- Reduced build time. Each time we do clean build in the project, it won't rebuild the React Native libraries.
- Easier integration for external build system such as `Bazel` or `Buck`. Each library updates will also be easier because we only need to import the xcframework instead of creating rules to compile the source codes.

# Getting Started

## Installing Required Tools
This project uses brew, GitHub CLI, and CocoaPods to distribute the prebuilt libraries.

### Step 1: Installing Brew
Run this command on your terminal
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Step 2: Installing GitHub CLI
Run this command on your terminal
```
brew install gh
```

### Step 3: Installing CocoaPods
Run this command on your terminal
```
brew install cocoapods
```

## Creating XCFrameworks

In order for the script to finish successfully you need to login into your GitHub account first via `gh auth login`.
You also need write permissions to this repository. Otherwise the script will fail distributing the prebuilt libraries.
However the built version will still be available in the project root directory as  `ios-rn-prebuilt.tar.gz`.

### Step 1: Set correct NODE_BINARY environment variable
Open .xcode.env from the root project directory and set the correct value for NODE_BINARY.

### Step 2: Download node_modules
In the root project directory, run `npm install` to install the required node_modules (React-Native).

### Step 3: Integrate the Libraries
In the root project directory, run `pod install` to install and integrate the libraries into the project.

### Step 4: Bump Version
Each new distribution will need to bump the project version. You can do this by changing the `version` variable in `ios-rn-prebuild.podspec`

### Step 5: Building the XCFrameworks and Distribute
Open `ios-rn-prebuilt.xcworkspace` and run `build-all-xcframework` scheme. It will create XCFrameworks, create releases and upload the `ios-rn-prebuilt.tar.gz` into this repository.

## Updating React-Native

For every react-native release the changelog and upgrade helper must be checked for breaking changes. However for most of the updates it should be sufficient to just update the version number in package.json.