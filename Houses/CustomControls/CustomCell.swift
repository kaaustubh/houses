//
//  CustomCell.swift
//  Houses
//
//  Created by Kaustubh on 08/02/21.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    var house: House?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(house: House){
        self.house = house
    
    }
}

