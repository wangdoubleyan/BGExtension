//
//  BGDateTime_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

extension NSDate {
    /// 时间戳转换成时间
    class func timeStampToDate(timeStamp:String) -> Date {
        let timeInterval:TimeInterval = TimeInterval(timeStamp)!
        return Date(timeIntervalSince1970: timeInterval)
    }
    
    /// 获取当前的时间戳
    class func getNowTimeStamp() -> String {
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        return String(timeInterval)
    }
    
    /// 获取当前的时间戳
    class func getNowTime() -> String {
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "HH:mm:ss.FFF"
        return dformatter.string(from: now)
    }
    
    /// 获取URL时间戳
    class func getUrlTimeStamp() -> String {
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "HHmmss"
        return dformatter.string(from: now)
    }
}
