//
//  SelfLocationTableViewCell.swift
//  myweather
//
//  Created by omari katamadze on 02.03.23.
//

import UIKit

class SelfLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        self.locationLabel.text = "გამოიყენე ჩემი ლოკაცია"
    
        }
}
