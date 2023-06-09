//
//  HourlyCollectionViewCell.swift
//  myweather
//
//  Created by omari katamadze on 14.03.23.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var hourlyImageVew: UIImageView!
    
    @IBOutlet weak var hourlyTime: UILabel!
    @IBOutlet weak var hourlyTemp: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    
    func configure(hourly: Hourly, indexPath: Int) {
        hourlyTemp.textColor = .white
        hourlyTime.textColor = .white
        hourlyImageVew.contentMode = .scaleAspectFit
        hourlyImageVew.image = UIImage(named: "\(hourly.weather.first!.icon)-1.png")
        hourlyTemp.text = "\(hourly.temp.doubleToString())°"
    }
}
