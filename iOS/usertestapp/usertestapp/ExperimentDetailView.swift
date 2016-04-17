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
    let descriptionStackView = UIStackView(forAutoLayout: ())
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

        let titleStackView = UIStackView(arrangedSubviews: [titleLabel])
        outerStackView.addArrangedSubview(titleStackView)
        outerStackView.addArrangedSubview(detailStackView)
        outerStackView.addArrangedSubview(descriptionStackView)
        outerStackView.addArrangedSubview(actionButton)
        
        outerStackView.axis = .Vertical
        outerStackView.alignment = .Fill
        outerStackView.distribution = .Fill
        outerStackView.spacing = 16
        
        titleStackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16)
        titleStackView.layoutMarginsRelativeArrangement = true
        
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addArrangedSubview(descriptionTextLabel)
        descriptionStackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        descriptionStackView.layoutMarginsRelativeArrangement = true
        descriptionStackView.axis = .Vertical
        descriptionStackView.spacing = 8
        
        titleLabel.font = UIFont(name: titleLabel.font!.fontName, size: 32)
        titleLabel.numberOfLines = 2
        
        descriptionTextLabel.numberOfLines = 0
        detailStackView.setupLayout()
        detailStackView.backgroundColor = UIColor.lightBlueBackgroundColor()
        
        
        actionButton.setImage(UIImage(named: "button_participate"), forState: .Normal)
    }
    
    func setExperiment(experiment: Experiment) {
        if experiment.description.isEmpty {
                outerStackView.removeArrangedSubview(descriptionStackView)
                descriptionStackView.hidden = true
        }
        titleLabel.text = experiment.title
        descriptionLabel.text = "Description"
        descriptionTextLabel.text = experiment.description
        detailStackView.setExperiment(experiment)
    }
    
}

