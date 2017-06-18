//
//  BaseRoundedCardCell.swift
//  HoverView
//
//  Created by Phillip Farrugia on 6/17/17.
//  Copyright © 2017 Phill Farrugia. All rights reserved.
//

import UIKit
import CoreMotion

internal class BaseRoundedCardCell: UICollectionViewCell {
    
    internal static let cellHeight: CGFloat = 470.0
    
    private static let kInnerMargin: CGFloat = 20.0
    
    /// Core Motion Manager
    private let motionManager = CMMotionManager()
    
    /// Long Press Gesture Recognizer
    private var longPressGestureRecognizer: UILongPressGestureRecognizer? = nil
    
    /// Is Pressed State
    private var isPressed: Bool = false
    
    /// Shadow View
    private weak var shadowView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureGestureRecognizer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureShadow()
    }
    
    // MARK: - Shadow
    
    private func configureShadow() {
        // Shadow View
        self.shadowView?.removeFromSuperview()
        let shadowView = UIView(frame: CGRect(x: BaseRoundedCardCell.kInnerMargin,
                                              y: BaseRoundedCardCell.kInnerMargin,
                                              width: bounds.width - (2 * BaseRoundedCardCell.kInnerMargin),
                                              height: bounds.height - (2 * BaseRoundedCardCell.kInnerMargin)))
        insertSubview(shadowView, at: 0)
        self.shadowView = shadowView
        
        // Roll/Pitch Dynamic Shadow
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.02
            motionManager.startDeviceMotionUpdates(to: .main, withHandler: { (motion, error) in
                if let motion = motion {
                    let pitch = motion.attitude.pitch * 10 // x-axis
                    let roll = motion.attitude.roll * 10 // y-axis
                    self.applyShadow(width: CGFloat(roll), height: CGFloat(pitch))
                }
            })
        }
    }
    
    private func applyShadow(width: CGFloat, height: CGFloat) {
        if let shadowView = shadowView {
            let shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 14.0)
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowRadius = 8.0
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: width, height: height)
            shadowView.layer.shadowOpacity = 0.35
            shadowView.layer.shadowPath = shadowPath.cgPath
        }
    }
    
    // MARK: - Gesture Recognizer
    
    private func configureGestureRecognizer() {
        // Long Press Gesture Recognizer
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(gestureRecognizer:)))
        longPressGestureRecognizer?.minimumPressDuration = 0.1
        addGestureRecognizer(longPressGestureRecognizer!)
    }
    
    internal func handleLongPressGesture(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            handleLongPressBegan()
        } else if gestureRecognizer.state == .ended || gestureRecognizer.state == .cancelled {
            handleLongPressEnded()
        }
    }
    
    private func handleLongPressBegan() {
        guard !isPressed else {
            return
        }
        
        isPressed = true
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.2,
                       options: .beginFromCurrentState,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    
    private func handleLongPressEnded() {
        guard isPressed else {
            return
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.2,
                       options: .beginFromCurrentState,
                       animations: {
                        self.transform = CGAffineTransform.identity
        }) { (finished) in
            self.isPressed = false
        }
    }
    
}

