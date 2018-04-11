//
//  BGImage_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 颜色生成高度和宽度都为1的图片
    static func imageWithColor(color:UIColor) -> UIImage {
        let rect:CGRect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        return image;
    }
    
    
    /// 等比例缩放图片
    func scaleImage(scale:CGFloat) -> UIImage {
        let size = CGSize.init(width: self.size.width*scale, height: self.size.height*scale)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        var rect = CGRect.zero
        rect.size=size
        self.draw(in: rect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage!
    }
    
    
}
