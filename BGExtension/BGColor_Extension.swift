//
//  BGColor_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

extension UIColor {
    /// 启动图片
    ///
    /// - Returns: <#return value description#>
    func showStartImages() ->UIColor {
        let infoDictionary=Bundle.main.infoDictionary
        let launchImagesArr:NSMutableArray = infoDictionary!["UILaunchImages"] as! NSMutableArray
        for launchImage in launchImagesArr {
            let launchinfo=launchImage as! NSDictionary
            let screenSizeStr = "{"+String(format: "%.0f", BGExtension.screenWidth)+", "+String(format: "%.0f", BGExtension.screenHeight)+"}"
            let launchImageSizeStr:String = launchinfo["UILaunchImageSize"] as! String
            if launchImageSizeStr==screenSizeStr{
                let startImageName:String = launchinfo["UILaunchImageName"] as! String
                let launchImage:UIImage = UIImage.init(named: startImageName)!
                return UIColor.init(patternImage: launchImage)
            }
        }
        return UIColor()
    }
}
