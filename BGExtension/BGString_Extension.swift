//
//  BGString_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

extension String {
    
    public var md5: String {
        return BGMD5().encodeMD5(digest: md5Digest)
    }
    
    public var md5Digest: [Byte] {
        let bytes = [Byte](self.utf8)
        let digest = BGMD5().md5(bytes)
        return digest.digest
    }
    
    /// 时间戳转换成时间
    public var timeStampToDate:Date {
        let timeInterval:TimeInterval = TimeInterval(self)!
        return Date(timeIntervalSince1970: timeInterval)
    }
    
    /// 获取内容宽度
    ///
    /// - Parameters:
    ///   - font: 字体
    ///   - height: 高度
    /// - Returns: 字体宽度
    public func getWidth(withFont font:UIFont,andHeight height:CGFloat ) -> CGFloat {
        return getTextRect(withFont: font, andHeight: height, orWidth: nil).width
    }
    
    /// 获取内容高度
    ///
    /// - Parameters:
    ///   - font: 字体
    ///   - width: 宽度
    /// - Returns: 内容高度
    public func getHeight(withFont font:UIFont,andWidth width:CGFloat ) -> CGFloat {
        return getTextRect(withFont: font, andHeight: nil, orWidth: width).height
    }
    
    /// 获取文字宽度
    ///
    /// - Parameters:
    ///   - font: 字体
    ///   - height: 高度
    /// - Returns: 字体宽度
    public func getTextRect(withFont font:UIFont,andHeight height:CGFloat?, orWidth width:CGFloat? ) -> CGRect {
        let attributedText:NSAttributedString = NSAttributedString.init(string: self, attributes: [NSAttributedStringKey.font : font])
        var size = CGSize()
        if height == nil {
            size = CGSize.init(width: width!, height: CGFloat.greatestFiniteMagnitude)
        }else{
            size = CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: height!)
        }
        return attributedText.boundingRect(with: size, options: .usesLineFragmentOrigin, context: nil)
    }
    
}


