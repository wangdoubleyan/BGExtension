//
//  BGView_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 高度
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    /// 尺寸
    public var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }
    
    /// 宽度
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    
    /// 移除手势
    public func removeGestureRecognizers() {
        gestureRecognizers?.forEach(removeGestureRecognizer)
    }
    
    /// 设置圆角
    func setCornerRadius(cornerRadius:CGFloat) {
        self.layer.cornerRadius=cornerRadius
        self.layer.masksToBounds=true
    }
    
    /// 移除全部子
    func removeAllSubview() {
        let subviewsArray : Array = self.subviews
        for view in subviewsArray {
            view.removeFromSuperview()
        }
    }
    
    /// 移除全部子
    func removeSubview(withClass removeClassName:String) {
        let subviewsArray : Array = self.subviews
        for view in subviewsArray {
            if view.className == removeClassName{
                view.removeFromSuperview()
            }
        }
    }
    
    /// 设置
    func setBorder(color:UIColor,width:CGFloat) {
        self.layer.borderColor=color.cgColor
        self.layer.borderWidth=width
    }
    
    func addTapGestureRecognizer(target: Any?, action: Selector) {
        let gr = UITapGestureRecognizer(target: target, action: action)
        gr.numberOfTapsRequired = 1
        isUserInteractionEnabled = true
        addGestureRecognizer(gr)
    }
}

class UIViewEffect : UIView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        backgroundColor = UIColor.groupTableViewBackground
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.15, animations: { () -> Void in
            self.backgroundColor = .clear
        })
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.15, animations: { () -> Void in
            self.backgroundColor = .clear
        })
    }
    
}
