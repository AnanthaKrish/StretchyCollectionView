//
//  STCollectionViewFlowLayout.swift
//  StretchyCollectionView
//
//  Created by Anantha Krishnan K G on 19/04/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import UIKit

class STCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        
        guard let offset = collectionView?.contentOffset, let stLayoutAttributes = layoutAttributes else {
            return layoutAttributes
        }
        if offset.y < 0 {
            
            for attributes in stLayoutAttributes {
                
                if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {
                    
                    let diffValue = abs(offset.y)
                    var frame = attributes.frame
                    frame.size.height = max(0, headerReferenceSize.height + diffValue)
                    frame.origin.y = frame.minY - diffValue
                    attributes.frame = frame
                }
            }
        }
        return layoutAttributes
    }
}
