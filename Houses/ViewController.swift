//
//  ViewController.swift
//  Houses
//
//  Created by Kaustubh on 08/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = DataSource()
    var houseToShowDetails: House?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = dataSource
        self.tableView.delegate = dataSource
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        dataSource.delegate = self
        self.loadHouses()
    }
    
    func loadHouses() {
        LoadingView.sharedInstance.showIndicator()
        HousesService().getHouses() {[weak self] houses, error in
            guard let self = self else {return}
            DispatchQueue.main.async{
                LoadingView.sharedInstance.hideIndicator()
                if error == nil {
                    if let houses = houses {
                        self.dataSource.appendHouses(newHouse: houses)
                        self.tableView.reloadData()
                    }
                }
                else {
                    var message = "Something went wrong!!!"
                    if let errorcode = error?.code {
                        message = "Something went wrong. Error code- " + "\(errorcode)"
                    }
                    Alert.show(title: "Error", message: message, buttonTitle: "Ok")
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let house = self.houseToShowDetails, segue.identifier == "details" {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.house = house
        }
    }
}

extension ViewController: TableViewControllerDelegate{
    func showDetails(for house: House) {
        self.houseToShowDetails = house
        self.performSegue(withIdentifier:"details", sender: nil)
    }
    
}

