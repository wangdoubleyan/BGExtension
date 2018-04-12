//
//  BGThread_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

extension Thread {
    
    /// 当前线程
    public func printCurrentThread(){
        let currentThread = Thread.current
        BGPrint(message: "当前线程为:\(currentThread)")
    }
    
    /// 打印主线程名称
    public func printMainThread() {
        let mainThread = Thread.main
        BGPrint(message: "应用程序的主线程:\(mainThread)")
    }
    
    public func printIsMainThread() {
        let isMain = Thread.isMainThread
        BGPrint(message: "当前是否是主线程:\(isMain)")
    }
    
    
}

