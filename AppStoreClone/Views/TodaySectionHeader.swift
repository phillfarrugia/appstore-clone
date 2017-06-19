//
//  TodaySectionHeader.swift
//  AppStoreClone
//
//  Created by Phillip Farrugia on 6/17/17.
//  Copyright © 2017 Phill Farrugia. All rights reserved.
//

import UIKit

class TodaySectionHeader: UICollectionReusableView {
    
    internal static let viewHeight: CGFloat = 81

    @IBOutlet private weak var profileImageView: UIImageView!
    
    internal var shouldShowProfileImageView: Bool = true {
        didSet {
            profileImageView.isHidden = !shouldShowProfileImageView
        }
    }
    
    // MARK: - Factory Method
    
    internal static func dequeue(fromCollectionView collectionView: UICollectionView, ofKind kind: String, atIndexPath indexPath: IndexPath) -> TodaySectionHeader {
        guard let view: TodaySectionHeader = collectionView.dequeueSupplementaryView(kind: kind, indexPath: indexPath) else {
            fatalError("*** Failed to dequeue TodaySectionHeader ***")
        }
        return view
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.width/2
        profileImageView.layer.borderWidth = 0.5
        profileImageView.layer.borderColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0).cgColor
    }
    
}
