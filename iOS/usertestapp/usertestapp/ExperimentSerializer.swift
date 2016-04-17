//
//  ExperimentSerializer.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import SwiftyJSON

class ExperimentSerializer {
    
    func serializeJSON(json: JSON, id: String) -> Experiment {
        guard let available = json["available"].bool,
        category = json["category"].string,
        description = json["description"].string,
        durationString = json["duration"].string,
        startDateString = json["startdate"].string,
        endDateString = json["enddate"].string,
        reward = json["reward"].string,
        title = json["name"].string,
        location = json["location"].string else {
            fatalError()
        }
        let duration: Int = Int(durationString)!
        let startDate = NSDate.dateFromString(startDateString)
        let endDate = NSDate.dateFromString(endDateString)
        return Experiment(id: id, title: title, startDate: startDate, endDate: endDate, location: location, type: category, description: description, reward: reward, duration: duration, available: available)
    }
    
    
}