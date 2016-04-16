//
//  ExperimentsViewModel.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation

class ExperimentsViewModel {
    
    let items: [Experiment]
    
    init() {
        let item1 = Experiment(id: "1", title: "Nummer 1", startDate: NSDate(), endDate: NSDate(), location: "Hier", type: "Laufen", description: "Coole Idee mit der App")
        let item2 = Experiment(id: "2", title: "Nummer 2", startDate: NSDate(), endDate: NSDate(), location: "Hier", type: "Laufen", description: "Coole Idee mit der App")
        let item3 = Experiment(id: "3", title: "Nummer 3", startDate: NSDate(), endDate: NSDate(), location: "Hier", type: "Laufen", description: "Coole Idee mit der App")
        items = [item1, item2, item3]
    }
    
    func itemAtIndex(index: Int) -> Experiment {
        return items[index]
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
}