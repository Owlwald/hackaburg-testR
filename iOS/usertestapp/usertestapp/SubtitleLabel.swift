//
//  SubtitleLabel.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import UIKit

class SubtitleLabel: BaseLabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: (self.font?.fontName)!, size: 20)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}