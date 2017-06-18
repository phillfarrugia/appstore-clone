//
//  BaseView.swift
//  HoverView
//
//  Created by Phillip Farrugia on 6/17/17.
//  Copyright © 2017 Phill Farrugia. All rights reserved.
//

import UIKit

/// A base UIView subclass that instaniates a view
/// from a nib file of the same class name in order to
/// allow reusable views to be created.
internal class BaseView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    /// Initializes the view from a xib
    /// file and configure initial constrains.
    func xibSetup() {
        let view = loadViewFromNib()
        addEdgeConstrainedSubView(view: view)
    }
    
    /// Loads a view from it's xib file.
    ///
    /// - Returns: an instantiated view from the Nib file of the same class name.
    fileprivate func loadViewFromNib<T: UIView>() -> T {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Cannot instantiate a UIView from the nib for class \(type(of: self))")
        }
        return view
    }
}

