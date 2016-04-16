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
    
    // SpacerView
    
    let spacerView = UIView(forAutoLayout: ())
    
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
        outerStackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        outerStackView.addArrangedSubview(titleLabel)
        outerStackView.addArrangedSubview(spacerView)
        outerStackView.addArrangedSubview(detailStackView)
        
        spacerView.autoSetDimension(.Height, toSize: 2)
        spacerView.backgroundColor = UIColor.navBarColor()
        
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