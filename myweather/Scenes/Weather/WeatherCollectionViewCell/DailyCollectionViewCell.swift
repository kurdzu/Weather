//
//  WeatherCollectionViewCell.swift
//  myweather
//
//  Created by omari katamadze on 28.02.23.
//

import UIKit

class DailyCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var maxTemp: UILabel!
    
    
    func configure(daily: Daily, indexPath: Int) {
        print(daily.temp.min)
       // dailyDate.textColor = .white
     //   dailyMaxTemp.textColor = .white
      //  dailyMinTemp.textColor = .white
      //  dailyImage.contentMode = .scaleAspectFit
     //   dailyImage.image = UIImage(named: "\(daily.weather.first!.icon)-1.png")
        maxTemp.text = "ss";
   //    dailyMinTemp.text = "\(daily.temp.min.doubleToString())°"
      //  dailyMaxTemp.text = "\(daily.temp.max.doubleToString())°"
    }
    
}
