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
    var searchTextField: UITextField?
    
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
        
        contentView.actionButton.addTarget(self, action: #selector(actionButtonPressed), forControlEvents: .TouchUpInside)
    }
    
    func actionButtonPressed() {
        let alertController = UIAlertController(title: "Contact information required", message: "Please enter a valid email", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            self.searchTextField = textField
            self.searchTextField?.placeholder = "Enter your email"
        }
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .Default) { UIAlertAction in
            let store = FireBaseStore.sharedInstance
            store.patchEmailForID(self.experiment.id, email: self.searchTextField!.text!).then { _ -> Void in
                
            }.error { _ in
            
            }
        }
        alertController.addAction(confirmAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}