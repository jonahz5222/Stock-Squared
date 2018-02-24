//
//  ViewController.swift
//  ActualGraphView
//
//  Created by Jonah Zukosky on 2/24/18.
//  Copyright © 2018 Zukosky, Jonah. All rights reserved.
//

import UIKit
import Charts
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var gainLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var percentGainLabel: UILabel!
    
    var lineChartEntry = [ChartDataEntry]()
    var averageArray = [Double]()
    
    let urlMonth = "https://api.iextrading.com/1.0/stock/HD/chart/1m"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        view.backgroundColor = UIColor.green
//        lineChartView.backgroundColor = UIColor.green
        
        requestAndUpdateAverages(for: urlMonth)
        
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func xAxisChanged(_ sender: UISegmentedControl) {
        guard let title = sender.titleForSegment(at: sender.selectedSegmentIndex) else {return}
        gainLabel.text = "Gain over \(title) "
     
        switch title {
        
        case "1 Month" :
            requestAndUpdateAverages(for: urlMonth)
        case "3 Months" :
            requestAndUpdateAverages(for: "https://api.iextrading.com/1.0/stock/goog/chart/3m")
        case "YTD" :
            requestAndUpdateAverages(for: "https://api.iextrading.com/1.0/stock/goog/chart/ytd")
        default :
            requestAndUpdateAverages(for: urlMonth)
        }
        
    
        
    }
    
    
    func requestAndUpdateAverages(for url : String) -> [Double]{
        if !lineChartEntry.isEmpty {
            lineChartEntry.removeAll(keepingCapacity: true)
            averageArray.removeAll(keepingCapacity: true)
        }
        
        
        
        
        Alamofire.request(url).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            
            
            if let json = response.result.value {
                //print("JSON: \(JSON(json))") // serialized json response
                if let data = response.data {
                    let json = JSON(data: data)
                    
                    
                        for (_, object) in json {
                            self.averageArray.append((Double(object["close"].stringValue))!)
                        }
                    
                    
                    
                    for number in self.averageArray {
                        let value = ChartDataEntry(x: Double(self.averageArray.index(of: number)!), y: number)
                        
                        self.lineChartEntry.append(value)
                        
                    }
                    
                    let set1 = LineChartDataSet(values: self.lineChartEntry,label: "APPL")
                    let data = LineChartData(dataSet: set1)
                    
                    self.lineChartView.data = data
                    self.lineChartView.gridBackgroundColor = .white
                    
                    print(self.averageArray)
                    if let currentPrice = self.averageArray.last,let firstPrice = self.averageArray.first{
                        self.currentPriceLabel.text = "\(String(describing: currentPrice))"
                        
                        
                        let percentGain = (currentPrice - firstPrice)/(firstPrice)*100
                        
                        self.percentGainLabel.text = "\(String(format:"%.2f", percentGain ))%"
                    }
                    
                    
                }
                
            }
            
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                //print("Data: \(utf8Text)") // original server data as UTF8 string
                
            }
            
            
            
        }
        
        
        
        return averageArray
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
