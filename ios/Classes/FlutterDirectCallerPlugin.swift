import Flutter
import UIKit

public class FlutterDirectCallerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_direct_caller_plugin", binaryMessenger: registrar.messenger())
    let instance = FlutterDirectCallerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "callNumber":
      if let args = call.arguments as? [String: Any], let number = args["number"] as? String {
        makeCall(to: number, result: result)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Missing phone number", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func makeCall(to number: String, result: @escaping FlutterResult) {
    #if targetEnvironment(simulator)
    print("Running on iOS Simulator. Calls are not supported.")
    result(FlutterError(code: "SIMULATOR_UNSUPPORTED", message: "Cannot make calls on a simulator", details: nil))
    return
    #endif

    let formattedNumber = "tel://\(number)"
    if let url = URL(string: formattedNumber), UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
      result(true)
    } else {
      result(FlutterError(code: "CALL_FAILED", message: "Cannot make a call", details: nil))
    }
  }
}
