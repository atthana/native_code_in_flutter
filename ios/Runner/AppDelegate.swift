import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // ========== Code to implement ==========
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.grassrootengineer.com",
                                              binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler({
    [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
    if(call.method == "getVersion") {
    var systemVersion = UIDevice.current.systemVersion

    result("IOS: \(systemVersion)")}
    else {
    result("error")
    return
      }
    })
    // ========== End code ==========

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
