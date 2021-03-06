//
//  Experiment.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation

class Experiment {
    
    let id: String
    let title: String
    let startDate: NSDate
    let endDate: NSDate
    let location: String
    let type: String
    let description: String
    let reward: String
    let duration: Int
    let available: Bool
    
    init(id: String,title: String,  startDate: NSDate, endDate: NSDate, location: String, type: String, description: String, reward: String, duration: Int, available: Bool) {
        self.id = id
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.location = location
        self.type = type
        self.description = description
        self.reward = reward
        self.duration = duration
        self.available = available
    }
    
}