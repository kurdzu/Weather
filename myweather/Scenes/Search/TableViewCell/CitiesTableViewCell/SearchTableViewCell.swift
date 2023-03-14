//
//  SearchTableViewCell.swift
//  myweather
//
//  Created by omari katamadze on 02.03.23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var cityName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(filteredCities: SearchCellViewModel) {
        cityName.text = filteredCities.city
        countryName.text = filteredCities.country
        self.backgroundColor = .clear
    }
    
}
