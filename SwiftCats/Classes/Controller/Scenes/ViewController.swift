//
//  ViewController.swift
//  SwiftCats
//
//  Created by Yilei He on 3/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Outlest
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- Variables
    var headerModels:[GenderHeaderCellModel] = []
    var tableDataArray:[GenderAndCats] = []
    
    //MARK:- View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromServer()
    }
    
    //MARK:- Setup DataSource
    func processResponse() {
        headerModels = []
        for genderObject in tableDataArray {
            let headerModel = GenderHeaderCellModel()
            for _ in genderObject.cats {
                headerModel.cells.append(CatCellsModel())
            }
            headerModels.append(headerModel)
        }
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    //MARK:- Web Services
    func fetchDataFromServer() {
        activityIndicator.startAnimating()
        NetworkService().getOwners { (ownersArrayResponse, error) in
            if (error != nil) {
                DispatchQueue.main.async {
                    self.showMessage(message: "\(error?.localizedDescription ?? "Unknown error")")
                    self.activityIndicator.stopAnimating()
                }
                return
            }
            print(ownersArrayResponse)
            self.tableDataArray = Owners(ownersArrayResponse).gendersAndCats
            self.processResponse()
        }
    }
}
//MARK:- TableView Methods
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerModel = headerModels[section]

        let cell = tableView.dequeueReusableCell(withIdentifier: headerModel.identifier) as! GenderHeaderTableCell
        cell.headerModel = headerModel
        cell.dataDict = tableDataArray[section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headerModels[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerModel = headerModels[indexPath.section]
        let cellModel = headerModel.cells[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier, for: indexPath) as! CatsTableViewCell
        cell.catName = tableDataArray[indexPath.section].cats[indexPath.row]
        return cell
    }
}

