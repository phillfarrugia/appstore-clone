//
//  WorldPremiereCell.swift
//  HoverView
//
//  Created by Phillip Farrugia on 6/17/17.
//  Copyright © 2017 Phill Farrugia. All rights reserved.
//

import UIKit
import CoreMotion

internal class WorldPremiereCell: BaseRoundedCardCell {
    
    /// Image View
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Factory Method
    
    internal static func dequeue(fromCollectionView collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> WorldPremiereCell {
        guard let cell: WorldPremiereCell = collectionView.dequeueReusableCell(indexPath: indexPath) else {
            fatalError("*** Failed to dequeue WorldPremiereCell ***")
        }
        return cell
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 14.0
    }

}
