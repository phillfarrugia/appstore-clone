//
//  WorldPremiereCell.swift
//  HoverView
//
//  Created by Phillip Farrugia on 6/17/17.
//  Copyright © 2017 Phill Farrugia. All rights reserved.
//

import UIKit
import CoreMotion

internal class GetStartedListCell: BaseRoundedCardCell {
    
    /// Image View
    @IBOutlet private weak var imageView: UIImageView!
    
    /// Overlay View
    @IBOutlet private weak var overlayView: UIView!
    
    /// Corner View
    @IBOutlet private weak var cornerView: UIView!
    
    // MARK: - Factory Method
    
    internal static func dequeue(fromCollectionView collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> GetStartedListCell {
        guard let cell: GetStartedListCell = collectionView.dequeueReusableCell(indexPath: indexPath) else {
            fatalError("*** Failed to dequeue GetStartedListCell ***")
        }
        return cell
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        cornerView.layer.cornerRadius = 14.0
        cornerView.clipsToBounds = true
    }

}
