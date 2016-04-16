//
//  ExperimentTableViewController.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import UIKit

class ExperimentTableViewController: UITableViewController {

    let viewModel: ExperimentsViewModel
    
    override init(style: UITableViewStyle) {
        viewModel = ExperimentsViewModel()
        super.init(style: style)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "default")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("default")
        
        let experiment = viewModel.itemAtIndex(indexPath.row)
        cell?.textLabel?.text = experiment.title
        cell?.detailTextLabel?.text = experiment.id
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
}