import Flutter
import UIKit
import CleverTapSDK
import clevertap_plugin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    registerPush()
    CleverTap.autoIntegrate() // integrate CleverTap SDK using the autoIntegrate option// Set the URL Delegate
    CleverTapPlugin.sharedInstance()?.applicationDidLaunch(options: launchOptions)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func registerPush() {
      // Register for Push notifications
      UNUserNotificationCenter.current().delegate = self
      // request Permissions
      UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .badge, .alert], completionHandler: {granted, error in
          if granted {
              DispatchQueue.main.async {
                  UIApplication.shared.registerForRemoteNotifications()
              }
          }
      })
  }

  override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        NSLog("%@: failed to register for remote notifications: %@", self.description, error.localizedDescription)
    }
    
  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        NSLog("%@: registered for remote notifications: %@", self.description, deviceToken.description)
    }
  
  override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        NSLog("%@: did receive notification response: %@", self.description, response.notification.request.content.userInfo)


        var channel: FlutterMethodChannel?
        // Assuming self.controller is an instance of FlutterViewController
        if let controller = self.window?.rootViewController as? FlutterViewController {
          channel = FlutterMethodChannel(name: "myChannel", binaryMessenger: controller.binaryMessenger)
          channel?.invokeMethod("pushClickedResponse", arguments: response.notification.request.content.userInfo)
        }

        completionHandler()
    }
    
  override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        NSLog("%@: will present notification: %@", self.description, notification.request.content.userInfo)
        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: notification.request.content.userInfo)
        completionHandler([.badge, .sound, .alert])
    }
    
  override func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        NSLog("%@: did receive remote notification completionhandler: %@", self.description, userInfo)
        completionHandler(UIBackgroundFetchResult.noData)
    }
    
  func pushNotificationTapped(withCustomExtras customExtras: [AnyHashable : Any]!) {
        NSLog("pushNotificationTapped: customExtras: ", customExtras)
    }
}
