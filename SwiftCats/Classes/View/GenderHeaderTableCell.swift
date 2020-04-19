//
//  GenderHeaderTableCell.swift
//  SwiftCats
//
//  Created by Arya Sreenivasan on 19/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import Foundation
import UIKit

class GenderHeaderTableCell: UITableViewCell {

    //MARK:- Outless
    @IBOutlet var genderLabel: UILabel!

    //MARK:- Variables
    var headerModel:GenderHeaderCellModel!
    var dataDict:GenderAndCats! {
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
        genderLabel.text = headerModel.getGenderName(dataDict: dataDict)
    }

}
