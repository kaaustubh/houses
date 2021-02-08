//
//  DetailViewController.swift
//  Houses
//
//  Created by Kaustubh on 08/02/21.
//

import Foundation

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var founder: UILabel!
    @IBOutlet weak var founded: UILabel!
    @IBOutlet weak var quoteLabelHeightConstraints: NSLayoutConstraint!
    
    var house: House?
    
    override func viewDidLoad() {
        updateHouseDetails()
    }
    
    func updateHouseDetails() {
        guard let house = house else {
            return
        }
        self.name.text = house.name
        self.region.text = house.region
        self.quoteLabelHeightConstraints.constant = house.coatOfArms.height(constraintedWidth: self.quote.frame.width, font: UIFont.systemFont(ofSize: 25.0))
        self.quote.text = house.coatOfArms
        self.founder.text = "Founded by: \(house.founder)"
        self.founded.text = "Founded in: \(house.founded)"
    }
}

extension String {
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()

        return label.frame.height
 }
}
