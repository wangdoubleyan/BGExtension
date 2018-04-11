//
//  BGExtension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/11.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

// MARK: - Properties
/// Common usefull properties and methods.
public struct BGExtension {
    
    /// App's name (if applicable).
    public static var appDisplayName: String? {
        // http://stackoverflow.com/questions/28254377/get-app-name-in-swift
        return Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
    }
    
    public static var targetName:String?{
        return Bundle.main.infoDictionary?["Target name"] as? String
    }
    
    public static var appLogoImage:UIImage{
        return UIImage.init(named: "AppIcon60x60")!
    }

    /// App's bundle ID (if applicable).
    public static var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }
    /// StatusBar height
    public static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    
    /// App current build number (if applicable).
    public static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    /// Application icon badge current number.
    public static var applicationIconBadgeNumber: Int {
        get {
            return UIApplication.shared.applicationIconBadgeNumber
        }
        set {
            UIApplication.shared.applicationIconBadgeNumber = newValue
        }
    }
    
    /// App's current version (if applicable).
    public static var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    /// Current battery level.
    public static var batteryLevel: Float {
        return UIDevice.current.batteryLevel
    }
    
    /// Shared instance of current device.
    public static var currentDevice: UIDevice {
        return UIDevice.current
    }
    
    /// Screen height.
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    /// Current device model.
    public static var deviceModel: String {
        return currentDevice.model
    }

    /// Current device name.
    public static var deviceName: String {
        return currentDevice.name
    }

    /// Current orientation of device.
    public static var deviceOrientation: UIDeviceOrientation {
        return currentDevice.orientation
    }

    /// Screen width.
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    
    /// Check if app is running in debug mode.
    public static var isInDebuggingMode: Bool {
        // http://stackoverflow.com/questions/9063100/xcode-ios-how-to-determine-whether-code-is-running-in-debug-release-build
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    /// Check if app is running in TestFlight mode.
    public static var isInTestFlight: Bool {
        // http://stackoverflow.com/questions/12431994/detect-testflight
        return Bundle.main.appStoreReceiptURL?.path.contains("sandboxReceipt") == true
    }

    /// Check if multitasking is supported in current device.
    public static var isMultitaskingSupported: Bool {
        return UIDevice.current.isMultitaskingSupported
    }

    /// Current status bar network activity indicator state.
    public static var isNetworkActivityIndicatorVisible: Bool {
        get {
            return UIApplication.shared.isNetworkActivityIndicatorVisible
        }
        set {
            UIApplication.shared.isNetworkActivityIndicatorVisible = newValue
        }
    }

    /// Check if device is iPad.
    public static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    /// Check if device is iPhone.
    public static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

    /// Check if device is registered for remote notifications for current app (read-only).
    public static var isRegisteredForRemoteNotifications: Bool {
        return UIApplication.shared.isRegisteredForRemoteNotifications
    }

    
    /// Check if application is running on simulator (read-only).
    public static var isRunningOnSimulator: Bool {
        // http://stackoverflow.com/questions/24869481/detect-if-app-is-being-built-for-device-or-simulator-in-swift
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }

    /// Status bar visibility state.
    public static var isStatusBarHidden: Bool {
        get {
            return UIApplication.shared.isStatusBarHidden
        }
        set {
            UIApplication.shared.isStatusBarHidden = newValue
        }
    }

    /// Key window (read only, if applicable).
    public static var keyWindow: UIView? {
        return UIApplication.shared.keyWindow
    }

    /// Most top view controller (if applicable).
    public static var mostTopViewController: UIViewController? {
        get {
            return UIApplication.shared.keyWindow?.rootViewController
        }
        set {
            UIApplication.shared.keyWindow?.rootViewController = newValue
        }
    }
    /// Shared instance UIApplication.
    public static var sharedApplication: UIApplication {
        return UIApplication.shared
    }
    /// Current status bar style (if applicable).
    public static var statusBarStyle: UIStatusBarStyle? {
        get {
            return UIApplication.shared.statusBarStyle
        }
        set {
            if let style = newValue {
                UIApplication.shared.statusBarStyle = style
            }
        }
    }
    /// System current version (read-only).
    public static var systemVersion: String {
        return currentDevice.systemVersion
    }
    
}

// MARK: - Methods
public extension BGExtension {
    
    /// Delay function or closure call.
    ///
    /// - Parameters:
    ///   - milliseconds: execute closure after the given delay.
    ///   - queue: a queue that completion closure should be executed on (default is DispatchQueue.main).
    ///   - completion: closure to be executed after delay.
    ///   - Returns: DispatchWorkItem task. You can call .cancel() on it to cancel delayed execution.
    @discardableResult public static func delay(milliseconds: Double, queue: DispatchQueue = .main, completion: @escaping () -> Void) -> DispatchWorkItem {
        let task = DispatchWorkItem { completion() }
        queue.asyncAfter(deadline: .now() + (milliseconds/1000), execute: task)
        return task
    }
    
    /// Debounce function or closure call.
    ///
    /// - Parameters:
    ///   - millisecondsOffset: allow execution of method if it was not called since millisecondsOffset.
    ///   - queue: a queue that action closure should be executed on (default is DispatchQueue.main).
    ///   - action: closure to be executed in a debounced way.
    public static func debounce(millisecondsDelay: Int, queue: DispatchQueue = .main, action: @escaping (() -> Void)) -> () -> Void {
        // http://stackoverflow.com/questions/27116684/how-can-i-debounce-a-method-call
        var lastFireTime = DispatchTime.now()
        let dispatchDelay = DispatchTimeInterval.milliseconds(millisecondsDelay)
        
        return {
            let dispatchTime: DispatchTime = lastFireTime + dispatchDelay
            queue.asyncAfter(deadline: dispatchTime) {
                let when: DispatchTime = lastFireTime + dispatchDelay
                let now = DispatchTime.now()
                if now.rawValue >= when.rawValue {
                    lastFireTime = DispatchTime.now()
                    action()
                }
            }
        }
    }
    
    /// Called when user takes a screenshot
    ///
    /// - Parameter action: a closure to run when user takes a screenshot
    public static func didTakeScreenShot(_ action: @escaping (_ notification: Notification) -> Void) {
        // http://stackoverflow.com/questions/13484516/ios-detection-of-screenshot
        _ = NotificationCenter.default.addObserver(forName: Notification.Name.UIApplicationUserDidTakeScreenshot, object: nil, queue: OperationQueue.main) { notification in
            action(notification)
        }
    }
    
    /// Class name of object as string.
    ///
    /// - Parameter object: Any object to find its class name.
    /// - Returns: Class name for given object.
    public static func typeName(for object: Any) -> String {
        let objectType = type(of: object.self)
        return String.init(describing: objectType)
    }
    
}




