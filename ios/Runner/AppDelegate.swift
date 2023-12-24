import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.my_flutter_app/my_channel", binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        // Handle method calls from Flutter here
        if call.method == "openSwiftScreen" {
          if let arguments = call.arguments as? [String: Any],
             let imageData = arguments["imageData"] as? FlutterStandardTypedData {
            let uint8List = imageData.data
            self?.openSwiftScreen(imageData: uint8List)
            result(nil)
          } else {
            result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments for openSwiftScreen", details: nil))
          }
        } else {
          result(FlutterMethodNotImplemented)
        }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func openSwiftScreen(imageData: Data) {
    // Code to open the Swift screen goes here
    // You can use the imageData (Uint8List) as needed in your Swift code
  }
}
