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
        self.tableView.registerClass(ExperimentTableViewCell.self, forCellReuseIdentifier: "default")
        self.tableView.estimatedRowHeight = 100
        self.title = "TestR"
        setupNavBarButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNavBarButtons() {
        let reloadButton = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(reload))
        let settingButton = UIBarButtonItem(image: UIImage(named: "icon_settings"), style: .Plain, target: self, action: #selector(settingsButtonPressed))
        self.navigationItem.rightBarButtonItems = [settingButton, reloadButton]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
    }
    
    func settingsButtonPressed() {
        let alertController = UIAlertController(title: "Settings", message: "Filter results", preferredStyle: .ActionSheet)
        let allAction = UIAlertAction(title: "Show all", style: .Default) { UIAlertAction -> Void in
            self.viewModel.filterOption = .All
            self.reload()
        }
        let todayAction = UIAlertAction(title: "Show today", style: .Default) { UIAlertAction -> Void in
            self.viewModel.filterOption = .Today
            self.reload()
        }
        let upcomingAction = UIAlertAction(title: "Show upcoming", style: .Default) { UIAlertAction -> Void in
            self.viewModel.filterOption = .Upcoming
            self.reload()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Destructive, handler: nil)
        alertController.addAction(allAction)
        alertController.addAction(todayAction)
        alertController.addAction(upcomingAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func reload() {
        viewModel.loadData().then { _ in
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("default") as! ExperimentTableViewCell
        
        let experiment = viewModel.itemAtIndex(indexPath.row)
        cell.setExperiment(experiment)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let experiment = viewModel.itemAtIndex(indexPath.row)
        let vc = ExperimentDetailViewController(experiment: experiment)
        vc.edgesForExtendedLayout = UIRectEdge.None
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}