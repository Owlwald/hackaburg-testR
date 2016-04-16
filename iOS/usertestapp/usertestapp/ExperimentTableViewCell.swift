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
        outerStackView.addArrangedSubview(titleLabel)
        outerStackView.addArrangedSubview(detailStackView)
        detailStackView.setupLayout()
        
                outerStackView.spacing = 8
        outerStackView.axis = .Vertical
        outerStackView.distribution = .Fill
        outerStackView.alignment = .Fill
        

            }
    
    func setExperiment(experiment: Experiment) {
        titleLabel.text = experiment.title
        detailStackView.setExperiment(experiment)
    }
    
    
}