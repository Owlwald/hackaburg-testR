//
//  ExperimentsViewModel.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON
import PromiseKit

class ExperimentsViewModel {
    
    var items: [Experiment]
    let store = FireBaseStore.sharedInstance
    
    var experimentsRef: Firebase?
    
    init() {
        items = []
        loadData()
    }
    
    func loadData() -> Promise<Void>{
        return store.getExperiments().then { items -> Void in
            self.items = items
            self.items.sortInPlace { $0.startDate.earlierDate($1.startDate) == $0.startDate }
        }
    }
    
    
    
    func itemAtIndex(index: Int) -> Experiment {
        return items[index]
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
}