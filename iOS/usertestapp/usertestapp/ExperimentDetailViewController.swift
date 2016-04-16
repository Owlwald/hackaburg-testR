//
//  ExperimentDetailViewController.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import UIKit
import PureLayout

class ExperimentDetailViewController: UIViewController {
    
    let contentView: ExperimentDetailView
    let experiment: Experiment
    
    init(experiment: Experiment){
        self.experiment = experiment
        self.contentView = ExperimentDetailView(forAutoLayout: ())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.title = "Details"
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(contentView)
        contentView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Bottom)
        contentView.setExperiment(self.experiment)
    }
    
}