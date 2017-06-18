//
//  WorldPremiereCell.swift
//  HoverView
//
//  Created by Phillip Farrugia on 6/17/17.
//  Copyright © 2017 Phill Farrugia. All rights reserved.
//

import UIKit
import CoreMotion

internal class AppOfTheDayCell: BaseRoundedCardCell {
    
    /// Image View
    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var iconImageView: UIImageView!
    
    @IBOutlet private weak var getButtonView: UIView!
    
    // MARK: - Factory Method
    
    internal static func dequeue(fromCollectionView collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> AppOfTheDayCell {
        guard let cell: AppOfTheDayCell = collectionView.dequeueReusableCell(indexPath: indexPath) else {
            fatalError("*** Failed to dequeue AppOfTheDayCell ***")
        }
        return cell
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 14.0
        iconImageView.layer.cornerRadius = 14.0
        getButtonView.layer.cornerRadius = getButtonView.bounds.height/2
    }

}
