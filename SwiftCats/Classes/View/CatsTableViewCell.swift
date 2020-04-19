//
//  CatsTableViewCell.swift
//  SwiftCats
//
//  Created by Arya Sreenivasan on 19/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import Foundation
import UIKit

class CatsTableViewCell: UITableViewCell {

    //MARK:- Outlet
    @IBOutlet var catNameLabel: UILabel!
    
    //MARK:- Variables
    var catName:String! {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- Cell configuration
    func configureCell() {
        catNameLabel.text = catName
    }
}
