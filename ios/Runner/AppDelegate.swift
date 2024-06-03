import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let commentsChannel = FlutterMethodChannel(name: "com.example.challenge_application/getChannel",
                                               binaryMessenger: controller.binaryMessenger)
    
    commentsChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
      guard call.method == "getChannel" else {
        result(FlutterMethodNotImplemented)
        return
      }
      if let args = call.arguments as? [String: Any],
         let urlString = args["url"] as? String,
         let postId = args["postId"] as? Int,// In this case I don't use it just to demonstrate that data can be passed from the channel.
         let headers = args["headers"] as? [String: String] {
        self?.getChannel(from: urlString, for: postId, headers: headers, result: result)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "URL, Post ID, and headers are required", details: nil))
      }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getChannel(from urlString: String, for postId: Int, headers: [String: String], result: @escaping FlutterResult) {
    let fullUrlString = urlString
    guard let url = URL(string: fullUrlString) else {
      result(FlutterError(code: "INVALID_URL", message: "The URL is invalid", details: nil))
      return
    }

    var request = URLRequest(url: url)
    for (key, value) in headers {
      request.addValue(value, forHTTPHeaderField: key)
    }

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let error = error {
        result(FlutterError(code: "NETWORK_ERROR", message: error.localizedDescription, details: nil))
        return
      }
      
      guard let data = data else {
        result(FlutterError(code: "NO_DATA", message: "No data received", details: nil))
        return
      }
      
      do {
        if let comments = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
          result(comments)
        } else {
          result(FlutterError(code: "PARSE_ERROR", message: "Failed to parse comments", details: nil))
        }
      } catch {
        result(FlutterError(code: "PARSE_ERROR", message: error.localizedDescription, details: nil))
      }
    }
    
    task.resume()
  }
}