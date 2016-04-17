//
//  FireBaseStore.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

class FireBaseStore {
    static let sharedInstance = FireBaseStore()
    
    let BASEURL = "https://testrhackaburg16.firebaseio.com"
    
    
    init() {

    }
    
    func getExperiments() -> Promise<[Experiment]> {
        return Promise<[Experiment]> { fulfill, reject in
            var items = [Experiment]()
            Alamofire.request(.GET, "https://testrhackaburg16.firebaseio.com/experiments.json").validate().responseJSON { response -> Void in
                let json = JSON(response.result.value!)
                for item in json {
                    let serializer = ExperimentSerializer()
                    items.append(serializer.serializeJSON(item.1, id: item.0))
                }
                fulfill(items)

            }
        }
    }
    
    func patchEmailForID(id:String, email: String) -> Promise<Void> {
        return Promise<Void> { fulfill, reject in
            let parameters = ["email" : email]
            Alamofire.request(.PATCH, "https://testrhackaburg16.firebaseio.com/experiments/\(id).json", parameters: parameters, encoding: .JSON).validate().responseJSON {
                response -> Void in
                if response.result.isSuccess {
                    fulfill()
                } else {
                    reject(response.result.error!)
                }
            }
        }
    }
}