//
//  Extensions.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import Foundation
import UIKit

extension String{
    
    func dateFromStringYearMonthDayNoTime() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self) else {return nil}
        return date
    }
}

extension Date{
    
    func formatDateForUI() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, yyyy"
        let date = formatter.string(from: self)
        return date
    }
}

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

extension UIViewController{
    
    func startActivityIndicator(blur: UIVisualEffectView, ai: UIActivityIndicatorView) -> Void {
        blur.frame = view.bounds
        blur.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        ai.center = blur.center
        ai.alpha = 0.0
        blur.alpha = 0.0
        view.addSubview(blur)
        view.addSubview(ai)
        
        ai.startAnimating()
        UIView.animate(withDuration: 0.3) {
            blur.alpha = 1.0
            ai.alpha = 1.0
        }
    }
    
    func stopActivityIndicator(blur: UIVisualEffectView, ai: UIActivityIndicatorView) -> Void{
        UIView.animate(withDuration: 0.25, animations: {
            blur.alpha = 0.0
            ai.alpha = 0.0
        }, completion: { finished in
            ai.stopAnimating()
            blur.removeFromSuperview()
            ai.removeFromSuperview()
        })
    }
}

extension UITableViewCell{
    
    func startActivityIndicator(ai: UIActivityIndicatorView) -> Void {
        ai.alpha = 0.0
        ai.startAnimating()
        UIView.animate(withDuration: 0.3) {
            ai.alpha = 1.0
        }
    }
    
    func stopActivityIndicator(ai: UIActivityIndicatorView) -> Void{
        UIView.animate(withDuration: 0.25, animations: {
            ai.alpha = 0.0
        }, completion: { finished in
            ai.stopAnimating()
            ai.removeFromSuperview()
        })
    }
}
