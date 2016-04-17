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
    
    enum FilterOption {
        case
            All,
            Upcoming,
            Today
    }
    
    var items: [Experiment]
    let store = FireBaseStore.sharedInstance
    var filterOption: FilterOption = .All
    
    var experimentsRef: Firebase?
    
    init() {
        items = []
        loadData()
    }
    
    func loadData() -> Promise<Void>{
        return store.getExperiments().then { items -> Void in
            self.items = items
            switch self.filterOption{
            case .All:
                break
            case .Upcoming:
                self.items = self.items.filter { !$0.startDate.isInPast() }
                break
            case .Today:
                self.items = self.items.filter { $0.startDate.isToday() }
                break
            }
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