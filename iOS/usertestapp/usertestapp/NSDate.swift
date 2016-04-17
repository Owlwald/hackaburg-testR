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
        dateFormatter.dateFormat = "YYYY-MM-DD HH:mm"
        return dateFormatter.dateFromString(string)!
    }
    
    var displayFormat: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd.MM"
        return dateFormatter.stringFromDate(self)
    }
}