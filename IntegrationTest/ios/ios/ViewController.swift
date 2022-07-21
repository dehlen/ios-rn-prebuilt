import React
import UIKit

public class ViewController: UIViewController {
    private enum Constants {
        static let moduleName = "WelcomeScreen"
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

extension ViewController: RCTBridgeDelegate {
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
