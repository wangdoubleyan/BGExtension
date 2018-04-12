//
//  BGNSObject_Extensions.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

extension NSObject {
    public var className: String {
        return type(of: self).className
    }
    
    public static var className: String {
        return stringFromClass(self)
    }
}

public func stringFromClass(_ type: AnyClass) -> String {
    return NSStringFromClass(type).components(separatedBy: ".").last!
}
