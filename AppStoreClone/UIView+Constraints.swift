//
//  UIView+Constraints.swift
//  AppStoreClone
//
//  Created by Phillip Farrugia on 6/17/17.
//  Copyright © 2017 Phill Farrugia. All rights reserved.
//

import UIKit

/// An extension which provides helper methods on UIView for
/// constraining subviews to their containing views. These methods
/// are primarily used to create Reusable views from xib files. See
/// BaseView.swift for more information.
extension UIView {
    
    /// Adds a view as a subview and constrains it to the edges
    /// of its new containing view.
    ///
    /// - Parameter view: view to add as subview and constrain
    internal func addEdgeConstrainedSubView(view: UIView) {
        addSubview(view)
        edgeConstrain(subView: view)
    }
    
    /// Constrains a given subview to all 4 sides
    /// of its containing view with a constant of 0.
    ///
    /// - Parameter subView: view to constrain to its container
    internal func edgeConstrain(subView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        // Top
        addConstraint(NSLayoutConstraint(item: subView,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .top,
                                         multiplier: 1.0,
                                         constant: 0))
        
        // Bottom
        addConstraint(NSLayoutConstraint(item: subView,
                                         attribute: .bottom,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 0))
        
        // Left
        addConstraint(NSLayoutConstraint(item: subView,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .left,
                                         multiplier: 1.0,
                                         constant: 0))
        
        // Right
        addConstraint(NSLayoutConstraint(item: subView,
                                         attribute: .right,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .right,
                                         multiplier: 1.0,
                                         constant: 0))
        
    }
    
}
