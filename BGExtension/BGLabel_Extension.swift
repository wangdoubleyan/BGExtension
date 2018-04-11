//
//  BGLabel_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(
        frame_:CGRect = CGRect.zero,
        text:String? = nil,
        font:UIFont? = nil,
        textColor:UIColor? = nil,
        backgroundColor:UIColor = UIColor.clear,
        textAlignment:NSTextAlignment = .left,
        userInteractionEnabled:Bool = false
        ){
        self.init(frame:frame_)
        if !(text?.isEmpty)!{
            self.text=text
        }
        if (textColor != nil){
            self.textColor=textColor
        }
        self.backgroundColor=backgroundColor
        if (font != nil){
            self.font=font
        }
        self.textAlignment=textAlignment
        self.isUserInteractionEnabled=userInteractionEnabled
    }
    
    
    
}
