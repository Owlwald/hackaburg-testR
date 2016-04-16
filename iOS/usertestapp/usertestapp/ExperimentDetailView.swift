//
//  ExperimentDetailView.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import UIKit

class ExperimentDetailView: UIView {
    let outerStackView = UIStackView(forAutoLayout: ())
    let titleLabel = BaseLabel(forAutoLayout: ())
    let detailStackView = DetailStackView(forAutoLayout: ())
    let descriptionLabel = BaseLabel(forAutoLayout: ())
    let descriptionTextLabel = SubtitleLabel(forAutoLayout: ())
    let actionButton = UIButton(forAutoLayout: ())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        outerStackView.addArrangedSubview(descriptionLabel)
        outerStackView.addArrangedSubview(descriptionTextLabel)
        outerStackView.addArrangedSubview(actionButton)
        
        outerStackView.axis = .Vertical
        outerStackView.alignment = .Fill
        outerStackView.distribution = .Fill
        outerStackView.spacing = 16
        
        titleLabel.font.fontWithSize(32)
        descriptionTextLabel.numberOfLines = 0
        detailStackView.setupLayout()
        
        actionButton.backgroundColor = UIColor.greenColor()
        actionButton.setTitle("Participate", forState: .Normal)
    }
    
    func setExperiment(experiment: Experiment) {
        titleLabel.text = experiment.title
        descriptionLabel.text = "Description"
        descriptionTextLabel.text = experiment.description
        detailStackView.setExperiment(experiment)
    }
    
}

