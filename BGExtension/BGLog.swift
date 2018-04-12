//
//  BGLog.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/11.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

/// 日志打印
///
/// - Parameters:
///   - message: <#message description#>
///   - file: <#file description#>
///   - lineNumber: <#lineNumber description#>
public func BGPrint<T>(message : T, file : String = #file, lineNumber : Int = #line){
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("📝 [\(fileName):line:\(lineNumber)]- \(NSDate.getNowTime())- \(message)")
    
    #endif
}

///打印当前线程日志
public func BGPrintThread(){
    Thread.printMainThread()
    Thread.printCurrentThread()
    Thread.printIsMainThread()
    //BGPrint(message: Thread.callStackSymbols)
}


class BGLog: NSObject {

}
