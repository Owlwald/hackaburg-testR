//
//  ExperimentTableViewCell.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class ExperimentTableViewCell: UITableViewCell {
    // StackViews
    let outerStackView = UIStackView(forAutoLayout: ())
    let detailStackView = DetailStackView(forAutoLayout: ())
      // TitleLabel
    let titleLabel = BaseLabel(forAutoLayout: ())
    

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.addSubview(outerStackView)
        outerStackView.autoPinEdgesToSuperviewEdges()
        outerStackView.layoutMarginsRelativeArrangement = true
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel])
        titleStackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16)
        titleStackView.layoutMarginsRelativeArrangement = true
        outerStackView.addArrangedSubview(titleStackView)
        outerStackView.addArrangedSubview(detailStackView)
        

        
        detailStackView.setupLayout()
        detailStackView.backgroundColor = UIColor.lightBlueBackgroundColor()
        
                outerStackView.spacing = 8
        outerStackView.axis = .Vertical
        outerStackView.distribution = .Fill
        outerStackView.alignment = .Fill
        
        titleLabel.numberOfLines = 2
        titleLabel.font = titleLabel.font.fontWithSize(24)
        
        
    }
    
    func setExperiment(experiment: Experiment) {
        titleLabel.text = experiment.title
        detailStackView.setExperiment(experiment)
    }
    
    
}