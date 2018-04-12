//
//  BGButton_Extension.swift
//  BGExtension
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import UIKit

public extension UIButton {
    
    public func setBgColor(color:UIColor,for state:UIControlState) {
        let image:UIImage = UIImage.init(color: color)
        self.setBackgroundImage(image, for: state)
    }
    
    /// Image of disabled state for button; also inspectable from Storyboard.
    @IBInspectable public var imageForDisabled: UIImage? {
        get {
            return image(for: .disabled)
        }
        set {
            setImage(newValue, for: .disabled)
        }
    }
    
    /// Image of highlighted state for button; also inspectable from Storyboard.
    @IBInspectable public var imageForHighlighted: UIImage? {
        get {
            return image(for: .highlighted)
        }
        set {
            setImage(newValue, for: .highlighted)
        }
    }
    
    /// Image of normal state for button; also inspectable from Storyboard.
    @IBInspectable public var imageForNormal: UIImage? {
        get {
            return image(for: .normal)
        }
        set {
            setImage(newValue, for: .normal)
        }
    }
    
    /// Image of selected state for button; also inspectable from Storyboard.
    @IBInspectable public var imageForSelected: UIImage? {
        get {
            return image(for: .selected)
        }
        set {
            setImage(newValue, for: .selected)
        }
    }
    
    /// Title color of disabled state for button; also inspectable from Storyboard.
    @IBInspectable public var titleColorForDisabled: UIColor? {
        get {
            return titleColor(for: .disabled)
        }
        set {
            setTitleColor(newValue, for: .disabled)
        }
    }
    
    /// Title color of highlighted state for button; also inspectable from Storyboard.
    @IBInspectable public var titleColorForHighlighted: UIColor? {
        get {
            return titleColor(for: .highlighted)
        }
        set {
            setTitleColor(newValue, for: .highlighted)
        }
    }
    
    /// Title color of normal state for button; also inspectable from Storyboard.
    @IBInspectable public var titleColorForNormal: UIColor? {
        get {
            return titleColor(for: .normal)
        }
        set {
            setTitleColor(newValue, for: .normal)
        }
    }
    
    /// Title color of selected state for button; also inspectable from Storyboard.
    @IBInspectable public var titleColorForSelected: UIColor? {
        get {
            return titleColor(for: .selected)
        }
        set {
            setTitleColor(newValue, for: .selected)
        }
    }
    
    /// Title of disabled state for button; also inspectable from Storyboard.
    @IBInspectable public var titleForDisabled: String? {
        get {
            return title(for: .disabled)
        }
        set {
            setTitle(newValue, for: .disabled)
        }
    }
    
    /// Title of highlighted state for button; also inspectable from Storyboard.
    @IBInspectable public var titleForHighlighted: String? {
        get {
            return title(for: .highlighted)
        }
        set {
            setTitle(newValue, for: .highlighted)
        }
    }
    
    /// Title of normal state for button; also inspectable from Storyboard.
    @IBInspectable public var titleForNormal: String? {
        get {
            return title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    /// Title of selected state for button; also inspectable from Storyboard.
    @IBInspectable public var titleForSelected: String? {
        get {
            return title(for: .selected)
        }
        set {
            setTitle(newValue, for: .selected)
        }
    }
    
}

// MARK: - Methods
public extension UIButton {
    
    private var states: [UIControlState] {
        return [.normal, .selected, .highlighted, .disabled]
    }
    
    /// Set image for all states.
    ///
    /// - Parameter image: UIImage.
    public func setImageForAllStates(_ image: UIImage) {
        states.forEach { self.setImage(image, for: $0) }
    }
    
    /// Set title color for all states.
    ///
    /// - Parameter color: UIColor.
    public func setTitleColorForAllStates(_ color: UIColor) {
        states.forEach { self.setTitleColor(color, for: $0) }
    }
    
    /// Set title for all states.
    ///
    /// - Parameter title: title string.
    public func setTitleForAllStates(_ title: String) {
        states.forEach { self.setTitle(title, for: $0) }
    }
    
    /// Center align title text and image on UIButton
    ///
    /// - Parameter spacing: spacing between UIButton title text and UIButton Image.
    public func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    
}
