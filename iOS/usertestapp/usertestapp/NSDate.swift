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
    
    var displayFormat: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.stringFromDate(self)
    }
}