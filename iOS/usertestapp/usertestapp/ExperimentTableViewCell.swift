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
    let detailStackView = UIStackView(forAutoLayout: ())
    let leftInnerDetailStackView = UIStackView(forAutoLayout: ())
    let rightInnerDetailStackView = UIStackView(forAutoLayout: ())
    
    // ImageLabels left
    let typeImageLabel = DetailImageLabel(forAutoLayout: ())
    let durationImageLabel = DetailImageLabel(forAutoLayout: ())
    
    // ImageLabels right
    let spotsImageLabel = DetailImageLabel(forAutoLayout: ())
    let timeImageLabel = DetailImageLabel(forAutoLayout: ())
    let locationImageLabel = DetailImageLabel(forAutoLayout: ())
    
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
        
        detailStackView.addArrangedSubview(leftInnerDetailStackView)
        detailStackView.addArrangedSubview(rightInnerDetailStackView)
        
        leftInnerDetailStackView.addArrangedSubview(typeImageLabel)
        leftInnerDetailStackView.addArrangedSubview(durationImageLabel)
        leftInnerDetailStackView.addArrangedSubview(UIView())
        
        rightInnerDetailStackView.addArrangedSubview(spotsImageLabel)
        rightInnerDetailStackView.addArrangedSubview(timeImageLabel)
        rightInnerDetailStackView.addArrangedSubview(locationImageLabel)
        
        outerStackView.spacing = 8
        outerStackView.axis = .Vertical
        outerStackView.distribution = .Fill
        outerStackView.alignment = .Fill
        
        detailStackView.axis = .Horizontal
        detailStackView.spacing = 16
        detailStackView.distribution = .FillEqually
        detailStackView.alignment = .Center
        
        leftInnerDetailStackView.axis = .Vertical
        leftInnerDetailStackView.spacing = 8
        leftInnerDetailStackView.distribution = .Fill
        leftInnerDetailStackView.alignment = .Leading
        
        rightInnerDetailStackView.axis = .Vertical
        rightInnerDetailStackView.spacing = 8
        rightInnerDetailStackView.distribution = .Fill
        rightInnerDetailStackView.alignment = .Leading
    }
    
    func setExperiment(experiment: Experiment) {
        titleLabel.text = experiment.title


        durationImageLabel.setImage("tabBarIcon")
        typeImageLabel.setImage("tabBarIcon")
        timeImageLabel.setImage("tabBarIcon")
        locationImageLabel.setImage("tabBarIcon")
        spotsImageLabel.setImage("tabBarIcon")
        
        typeImageLabel.setTitle(experiment.type)
        timeImageLabel.setTitle(experiment.startDate.displayFormat)
        spotsImageLabel.setTitle("15 von 30")
        locationImageLabel.setTitle(experiment.location)
        durationImageLabel.setTitle("\(experiment.duration)")
        
        
    }
    
    
}