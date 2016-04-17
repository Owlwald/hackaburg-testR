//
//  NSString.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 17.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation

extension String {
    
    func validateStringAsEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluateWithObject(self)
    }
}