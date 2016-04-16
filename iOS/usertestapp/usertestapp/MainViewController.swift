//
//  MainViewController.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class MainViewController: UIViewController {
    
    let contentView: UIView
    
    init() {
        contentView = UIView(forAutoLayout: ())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        contentView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(contentView)
        contentView.autoPinEdgesToSuperviewEdges()
        super.viewDidLoad()
    }
    
}
