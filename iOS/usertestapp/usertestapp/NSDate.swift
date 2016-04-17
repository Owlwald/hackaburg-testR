//
//  NSDate.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation

extension NSDate {
    
    var apiFormat: String {
        return ""
    }
    
    static func dateFromString(string: String) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "y-MM-dd HH:mm"
        return dateFormatter.dateFromString(string)!
    }
    
    var displayFormat: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd.MM.y"
        return dateFormatter.stringFromDate(self)
    }
    
    func isInPast() -> Bool {
        return self.earlierDate(NSDate()) == self
    }
    
    func isToday() -> Bool {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        
        let selfAsString = dateFormatter.stringFromDate(self)
        let nowAsString = dateFormatter.stringFromDate(NSDate())
        return selfAsString == nowAsString
    }
}