//
//  DailyDetailCollectionViewCell.swift
//  myweather
//
//  Created by omari katamadze on 28.02.23.
//

import UIKit

class testDailyCollectionViewCell: UICollectionViewCell {
 


    @IBOutlet weak var dailyDate: UILabel!
    @IBOutlet weak var dailyMinTemp: UILabel!
    @IBOutlet weak var dailyMaxTemp: UILabel!
    @IBOutlet weak var dailyImage: UIImageView!

    var mstackView = UIStackView();
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }

    func configure(daily :Daily , indexPath: Int){
        
        dailyDate.textColor = .white
        dailyMaxTemp.textColor = .white
        dailyMinTemp.textColor = .white
        dailyImage.contentMode = .scaleAspectFill
        dailyImage.clipsToBounds = true
        dailyImage.image = UIImage(named: "\(daily.weather.first!.icon)-1.png")
        dailyMinTemp.text = "\(daily.temp.min.doubleToString())°"
        dailyMaxTemp.text = "\(daily.temp.max.doubleToString())°"
        
    }

}
