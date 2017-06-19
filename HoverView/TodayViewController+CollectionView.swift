//
//  TodayViewController+CollectionView.swift
//  HoverView
//
//  Created by Phillip Farrugia on 6/17/17.
//  Copyright © 2017 Phill Farrugia. All rights reserved.
//

import UIKit

extension TodayViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Configuration
    
    internal func configure(collectionView: UICollectionView) {
        collectionView.registerReusableCell(WorldPremiereCell.self)
        collectionView.registerReusableCell(FromTheEditorsCell.self)
        collectionView.registerReusableCell(AppOfTheDayCell.self)
        collectionView.registerReusableCell(GetStartedListCell.self)
        collectionView.registerSupplementaryView(TodaySectionHeader.self, kind: UICollectionElementKindSectionHeader)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return WorldPremiereCell.dequeue(fromCollectionView: collectionView, atIndexPath: indexPath)
        } else if indexPath.row == 1 {
            return AppOfTheDayCell.dequeue(fromCollectionView: collectionView, atIndexPath: indexPath)
        } else if indexPath.row == 2 {
            return FromTheEditorsCell.dequeue(fromCollectionView: collectionView, atIndexPath: indexPath)
        } else {
            return GetStartedListCell.dequeue(fromCollectionView: collectionView, atIndexPath: indexPath)
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return CGSize(width: collectionView.bounds.width, height: BaseRoundedCardCell.cellHeight)
        } else {
            
            // Number of Items per Row
            let numberOfItemsInRow = 2
            
            // Current Row Number
            let rowNumber = indexPath.item/numberOfItemsInRow
            
            // Compressed With
            let compressedWidth = collectionView.bounds.width/3
            
            // Expanded Width
            let expandedWidth = (collectionView.bounds.width/3) * 2
            
            // Is Even Row
            let isEvenRow = rowNumber % 2 == 0
            
            // Is First Item in Row
            let isFirstItem = indexPath.item % numberOfItemsInRow != 0
            
            // Calculate Width
            var width: CGFloat = 0.0
            if isEvenRow {
                width = isFirstItem ? compressedWidth : expandedWidth
            } else {
                width = isFirstItem ? expandedWidth : compressedWidth
            }
            
            return CGSize(width: width, height: BaseRoundedCardCell.cellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: TodaySectionHeader.viewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = TodaySectionHeader.dequeue(fromCollectionView: collectionView, ofKind: kind, atIndexPath: indexPath)
        sectionHeader.shouldShowProfileImageView = (indexPath.section == 0)
        return sectionHeader
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            presentStoryAnimationController.selectedCardFrame = cell.frame
            dismissStoryAnimationController.selectedCardFrame = cell.frame
            performSegue(withIdentifier: "presentStory", sender: self)
        }
    }
    
    
}
