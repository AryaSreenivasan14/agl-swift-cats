//
//  Owners.swift
//  SwiftCats
//
//  Created by Arya Sreenivasan on 19/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import Foundation
import UIKit

class Owners: NSObject {
    var gendersAndCats:[GenderAndCats] = []
    
    init(_ array:[[String:Any]]) {
        
        gendersAndCats = []
        for objectAtIndex in array {
            let owner = Owner(objectAtIndex)
            if let index = gendersAndCats.firstIndex(where: {$0.gender == owner.gender}) {
                let genderAndCatsObject:GenderAndCats = gendersAndCats[index]
                genderAndCatsObject.gender = owner.gender
                for cat in owner.cats {
                    genderAndCatsObject.cats.append(cat)
                }
                genderAndCatsObject.cats = genderAndCatsObject.cats.sorted(by: {$0<$1})
                gendersAndCats[index] = genderAndCatsObject
            } else {
                let genderAndCatsObject:GenderAndCats = GenderAndCats([:])
                genderAndCatsObject.gender = owner.gender
                for cat in owner.cats {
                    genderAndCatsObject.cats.append(cat)
                }
                genderAndCatsObject.cats = genderAndCatsObject.cats.sorted(by: {$0<$1})
                gendersAndCats.append(genderAndCatsObject)
            }
        }
        
        
    }
}

class GenderAndCats: NSObject {
    var gender:String = ""
    var cats:[String] = []
    
    init(_ dict: [String:Any]) {
        gender = dict["gender"] as? String ?? ""
        cats   = dict["cats"] as? [String] ?? []
    }
}

class Owner: NSObject {
    var gender:String = ""
    var pets:[Pet] = []
    var cats:[String] = []
    
    init(_ dict:[String:Any]) {
        gender = dict["gender"] as? String ?? ""
        
        pets = []
        cats = []
        let petsArray = dict["pets"] as? [[String:Any]] ?? []
        for objectAtIndex in petsArray {
            let pet = Pet(objectAtIndex)
            pets.append(pet)
            if (pet.type == "Cat") {
                cats.append(pet.name)
            }
        }
    }
    
}

class Pet: NSObject {
    var name:String = ""
    var type:String = ""

    init(_ dict:[String:Any]) {
        name = dict["name"] as? String ?? ""
        type = dict["type"] as? String ?? ""
    }
}
