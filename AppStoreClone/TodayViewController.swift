//
//  ViewController.swift
//  AppStoreClone
//
//  Created by Phillip Farrugia on 6/17/17.
//  Copyright © 2017 Phill Farrugia. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    internal let presentStoryAnimationController = PresentStoryViewAnimationController()
    internal let dismissStoryAnimationController = DismissStoryViewAnimationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(collectionView: collectionView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination
        destinationViewController.transitioningDelegate = self
    }

}

extension TodayViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentStoryAnimationController
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissStoryAnimationController
    }
    
}

