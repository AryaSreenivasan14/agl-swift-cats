//
//  NetworkService.swift
//  SwiftCats
//
//  Created by Yilei He on 3/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import Foundation

//MARK: Static API Headers
struct ConstantAPI {
     static let WEBSERVICE_URL:String = "https://agl-developer-test.azurewebsites.net/people.json"
}

final class NetworkService {
//    func getOwners(completionHandler: @escaping ([Owner]) -> Void) {
//        let url = URL(string: "https://agl-developer-test.azurewebsites.net/people.json")!
//        URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data else { return }
//            guard let owners = try? JSONDecoder().decode([Owner].self, from: data) else { return }
//            completionHandler(owners)
//        }.resume()
//    }
    
    //MARK: Asynchronous API Call
    func getOwners(completion: @escaping ([[String: Any]], _ error:Error?) -> ()) {
        
        let requestURLString = ConstantAPI.WEBSERVICE_URL
        let request = NSMutableURLRequest(url: URL(string: requestURLString)!)
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion([],error)
            } else {
                do {
                    if  let jsonDict = try JSONSerialization.jsonObject(with: data!) as? [[String: Any]] {
                        completion(jsonDict,nil)
                    }else {
                        completion([],nil)
                    }
                } catch let parsingError {
                    completion([],parsingError)
                }
            }
        })
        dataTask.resume()
    }
}
