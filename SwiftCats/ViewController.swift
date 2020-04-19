//
//  ViewController.swift
//  SwiftCats
//
//  Created by Yilei He on 3/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromServer()
    }
    
    //MARK:- Web Services
    func fetchDataFromServer() {
        NetworkService().getOwners { (ownersArrayResponse, error) in
            if (error != nil) {
                return
            }
            print(ownersArrayResponse)
        }
    }
}

