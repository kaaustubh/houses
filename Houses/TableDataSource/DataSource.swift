//
//  DataSource.swift
//  Houses
//
//  Created by Kaustubh on 08/02/21.
//

import Foundation
import UIKit

protocol TableViewControllerDelegate {
    func showDetails(for house: House)
}

class DataSource: NSObject {
    var houses = [House]()
    var delegate : TableViewControllerDelegate?
    func appendHouses(newHouse: [House]) {
        houses.append(contentsOf: newHouse)
    }
}


extension DataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.accessoryType = .detailDisclosureButton
        let house = houses[indexPath.row]
        
        cell.textLabel?.text = house.name
        cell.detailTextLabel?.text = house.region
    
        return cell
    }
    
}

extension DataSource : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let delegate = delegate else {
            return
        }
        delegate.showDetails(for: houses[indexPath.row])
    }
}
