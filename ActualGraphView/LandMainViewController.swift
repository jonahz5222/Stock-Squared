//
//  LandMainViewController.swift
//  ActualGraphView
//
//  Created by William Morrison on 2/24/18.
//  Copyright © 2018 Zukosky, Jonah. All rights reserved.
//

import UIKit



class LandMainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    
    var lengthyLabel = MarqueeLabel.init(frame: aFrame, duration: 8.0, fadeLength: 10.0)
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sam", for: indexPath) as! CustomStockCollectionViewCell
        //Bundle.main.loadNibNamed("StocksCollectionViewCell", owner: self, options: nil)?.first as! StocksCollectionViewCell
        //collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        //let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StockCollectionViewCell
        if(arc4random_uniform(2) == 1){
            cell.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255))/255, green: 0, blue: 0, alpha: 1)
        }
        else{
            cell.backgroundColor = UIColor(red: 0, green: CGFloat(arc4random_uniform(255))/255, blue: 0, alpha: 1)
        }
        
        //var label = cell.viewWithTag(1) as! UILabel
        //cell.stockLabel.text = "AAPL"
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainCollectionView.register(UINib(nibName: "CustomStockCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sam")
        
        let itemSize = UIScreen.main.bounds.width/3 - 2
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        
        mainCollectionView.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
