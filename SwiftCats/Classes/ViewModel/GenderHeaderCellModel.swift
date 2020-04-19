//
//  GenderHeaderCellModel.swift
//  SwiftCats
//
//  Created by Arya Sreenivasan on 19/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import Foundation
import UIKit

class GenderHeaderCellModel: NSObject {
    
    var identifier:String   = "cell.identifier.home.mainTable.GenderHeader"
    var cells:[CatCellsModel] = []
    
    func getGenderName(dataDict:GenderAndCats) -> String {
        return dataDict.gender
    }
}
