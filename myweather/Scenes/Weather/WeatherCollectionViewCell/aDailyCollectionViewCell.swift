//
//  WeatherCollectionViewCell.swift
//  myweather
//
//  Created by omari katamadze on 28.02.23.
//

import UIKit

class aDailyCollectionViewCell: UICollectionViewCell {
    var dailyImage = UIImageView()
    var dailyDate = UILabel()
    var dailyMaxTemp = UILabel()
    var dailyMinTemp = UILabel()
    let dailyTempStackView = UIStackView();
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
     
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        dailyDate.frame = bounds
   //     let dailyTempStackView = UIStackView(arrangedSubviews: [dailyMaxTemp,dailyMinTemp])
        dailyTempStackView.addSubview(dailyMaxTemp)
        dailyTempStackView.addSubview(dailyMinTemp)
        dailyTempStackView.axis = .horizontal
        dailyTempStackView.alignment = .fill
        dailyTempStackView.distribution = .fillEqually
        dailyTempStackView.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
      
      

//        let temView = UIView();
//        temView.addSubview(dailyTempStackView)
//        temView.frame = bounds
//        let dailyStackView = UIStackView(arrangedSubviews: [dailyDate,dailyTempStackView])
//        dailyStackView.alignment = .fill
//        dailyStackView.axis = .vertical
//        dailyStackView.distribution = .fill
//        dailyStackView.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
//
//        let dailyView = UIView();
//        dailyView.addSubview(dailyStackView)
//
//        mainStackView.addSubview(dailyImage)
//        mainStackView.addSubview(dailyView)
//        mainStackView.axis = .vertical
//        mainStackView.alignment = .fill
//        mainStackView.distribution = .fill
        
     
    }
    
    func setupLayout(){
        //addSubview()
        
        self.addSubview(dailyTempStackView)
        dailyTempStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0).isActive = true
        dailyTempStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0).isActive = true
        
    }
    func configure(daily: Daily, indexPath: Int) {
        dailyDate.textColor = .black
        dailyMaxTemp.textColor = .white
        dailyMinTemp.textColor = .white
        dailyImage.contentMode = .scaleAspectFit
        dailyImage.image = UIImage(named: "\(daily.weather.first!.icon)-1.png")
        dailyMinTemp.text = "\(daily.temp.min.doubleToString())°"
        dailyMaxTemp.text = "\(daily.temp.max.doubleToString())°"
    }
}
