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
        alertController.view.tintColor = UIColor.navBarColor()
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            self.searchTextField = textField
            self.searchTextField?.placeholder = "Enter your email"
        }
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .Cancel) { UIAlertAction in
            if let searchFieldInput = self.searchTextField?.text {
                if searchFieldInput.validateStringAsEmail() {
                    let store = FireBaseStore.sharedInstance
                    store.patchEmailForID(self.experiment.id, email: self.searchTextField!.text!).then { _ -> Void in
                            self.showFeedbackSuccess()
                        }.error { _ in
                            self.showFeedbackFailure()
                    }
                } else {
                    self.actionButtonPressed()
                }
            }

        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .Destructive, handler: nil)
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func showFeedbackSuccess() {
        let alertController = UIAlertController(title: "Success!", message: "Your request was successful", preferredStyle: .Alert)
        let okAktion = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAktion)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func showFeedbackFailure() {
        let alertController = UIAlertController(title: "Error!", message: "Ops! Something went wrong! Try Again!", preferredStyle: .Alert)
        let okAktion = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAktion)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
}