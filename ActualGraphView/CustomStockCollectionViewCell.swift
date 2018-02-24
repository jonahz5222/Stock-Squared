//
//  CustomStockCollectionViewCell.swift
//  ActualGraphView
//
//  Created by William Morrison on 2/24/18.
//  Copyright © 2018 Zukosky, Jonah. All rights reserved.
//

import UIKit

class CustomStockCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var stockView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stockID", for: indexPath) as! StockBlockCollectionViewCell
        
        if(arc4random_uniform(2) == 1){
            cell.backgroundColor = UIColor(red: CGFloat(200 + arc4random_uniform(55))/255, green: 0, blue: 0, alpha: 1)
        }
        else{
            cell.backgroundColor = UIColor(red: 0, green: CGFloat(200 + arc4random_uniform(55))/255, blue: 0, alpha: 1)
        }
        
        //var label = cell.viewWithTag(1) as! UILabel
        cell.stockLabel.text = "AAPL"
        
        return cell
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.stockView.delegate = self
        self.stockView.dataSource = self
        
        self.stockView.register(UINib(nibName: "StockBlockCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "stockID")
        
        let itemSize = (UIScreen.main.bounds.width/3 - 2)/3 - 2
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        
        //NSLog("vvvv\((UIScreen.main.bounds.width/3 - 2)/3 - 2)")
        
        stockView.collectionViewLayout = layout
    }

}
