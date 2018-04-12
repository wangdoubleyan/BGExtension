//
//  BGThread_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

extension Thread {
    
    public var currentThreadSring:String{
        let currentThread = Thread.current
        return "当前线程为:\(currentThread)"
    }
    
    public var mainThreadSring:String{
        let mainThread = self.main
        return "应用程序的主线程:\(mainThread)"
    }
    
    public var isMainThread:String{
        let isMain = self.isMainThread
        return "应用程序的主线程:\(isMain)"
    }
    
    
}

