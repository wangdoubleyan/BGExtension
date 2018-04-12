//
//  BGDateTime_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

public extension NSDate {

    
    /// 获取当前的时间戳
    public var nowTimeStamp:String{
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        return String(timeInterval)
    }
    
    /// 获取URL时间戳
    public var urlTimeStamp:String{
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "HHmmss"
        return dformatter.string(from: now)
    }
    
    /// 当前的时间戳
    public var nowTime:String{
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "HH:mm:ss.FFF"
        return dformatter.string(from: now)
    }
    
}
