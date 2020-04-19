//
//  ExtensionManager.swift
//  SwiftCats
//
//  Created by Arya Sreenivasan on 19/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showMessage(message :String) {
        let alert:UIAlertController = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert);
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
