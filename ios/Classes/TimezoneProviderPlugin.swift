import Flutter
import UIKit

public class TimezoneProviderPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "timezone_provider", binaryMessenger: registrar.messenger())
    let instance = TimezoneProviderPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getTimezone":
      result(TimeZone.current.identifier)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
