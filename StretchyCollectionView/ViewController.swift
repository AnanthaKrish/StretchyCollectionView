//
//  ViewController.swift
//  StretchyCollectionView
//
//  Created by Anantha Krishnan K G on 19/04/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stCollectionView: UICollectionView!
    let width = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stCollectionView.delegate = self
        stCollectionView.dataSource = self
        
        stCollectionView.contentInsetAdjustmentBehavior = .never
    }


}




extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stCCell", for: indexPath) as UICollectionViewCell
        
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 10.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "stCHeadCell", for: indexPath) as? STCollectionReusableView else {
                    fatalError("Invalid view type")
            }
            
            headerView.imgView.image = #imageLiteral(resourceName: "img")
            return headerView
        default:
            // 4
            assert(false, "Invalid element type")
        }
    }
    
    
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let value = width * 0.4
        
        return .init(width: value, height: value)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let value = (width * 0.2) * 0.4
        return .init(top: 10, left: value, bottom: 10, right: value)
    }
}
