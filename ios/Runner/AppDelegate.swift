import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let nativeCommunicationChannel = FlutterMethodChannel(name: "example.flutter.dev/nativeViewCommunication",
                                              binaryMessenger: controller.binaryMessenger)
    nativeCommunicationChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        
        if call.method == "getResult" {
            var argsMessage = String()
            guard let fluttrArgumnts =  call.arguments as? NSDictionary else{
                return
            }
            
            // Get Arguments
            if let value = fluttrArgumnts.value(forKey: "message") as? String {
                argsMessage = value
            }
            else{
                argsMessage = ""
            }
            
            self.window?.rootViewController = nil
            
            let viewToPush = FirstViewController()
            viewToPush.results = result
            viewToPush.argsMessage = argsMessage
            let navigationController = UINavigationController(rootViewController: controller)
            viewToPush.myNav = navigationController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.makeKeyAndVisible()
            self.window.rootViewController = navigationController
            navigationController.isNavigationBarHidden = true
            navigationController.pushViewController(viewToPush, animated: false)
        } else {
            result(FlutterMethodNotImplemented)
            return
        }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
