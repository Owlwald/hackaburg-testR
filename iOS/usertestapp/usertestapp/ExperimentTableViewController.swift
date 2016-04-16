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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
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
        print(experiment)
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