//
//  BGViewController_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// 获取当前显示的UIViewController
    public func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
    
    /// 添加通知
    ///
    /// - Parameters:
    ///   - name: 名称
    ///   - selector: 事件
    public func addNotificationObserver(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    
    
    /// 移除指定通知
    ///
    /// - Parameter name: <#name description#>
    public func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }
    
    
    /// 移除当前全部通知
    public func removeNotificationsObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
}
