//
//  DetailStackView.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import UIKit

class DetailStackView: UIStackView {
    
    let leftInnerDetailStackView = UIStackView(forAutoLayout: ())
    let rightInnerDetailStackView = UIStackView(forAutoLayout: ())
    
    // ImageLabels left
    let typeImageLabel = DetailImageLabel(forAutoLayout: ())
    let durationImageLabel = DetailImageLabel(forAutoLayout: ())
    let rewardImageLabel = DetailImageLabel(forAutoLayout: ())
    
    // ImageLabels right
    let spotsImageLabel = DetailImageLabel(forAutoLayout: ())
    let timeImageLabel = DetailImageLabel(forAutoLayout: ())
    let locationImageLabel = DetailImageLabel(forAutoLayout: ())
    

    
    func setupLayout() {
        self.addArrangedSubview(leftInnerDetailStackView)
        self.addArrangedSubview(rightInnerDetailStackView)
        
        self.axis = .Horizontal
        self.spacing = 16
        self.distribution = .FillEqually
        self.alignment = .Center
        
        leftInnerDetailStackView.addArrangedSubview(typeImageLabel)
        leftInnerDetailStackView.addArrangedSubview(durationImageLabel)
        leftInnerDetailStackView.addArrangedSubview(rewardImageLabel)
        
        rightInnerDetailStackView.addArrangedSubview(spotsImageLabel)
        rightInnerDetailStackView.addArrangedSubview(timeImageLabel)
        rightInnerDetailStackView.addArrangedSubview(locationImageLabel)
        
        
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
        durationImageLabel.setImage("tabBarIcon")
        typeImageLabel.setImage("tabBarIcon")
        timeImageLabel.setImage("tabBarIcon")
        locationImageLabel.setImage("tabBarIcon")
        spotsImageLabel.setImage("tabBarIcon")
        rewardImageLabel.setImage("tabBarIcon")
        
        typeImageLabel.setTitle(experiment.type)
        timeImageLabel.setTitle(experiment.startDate.displayFormat)
        spotsImageLabel.setTitle("15 von 30")
        locationImageLabel.setTitle(experiment.location)
        durationImageLabel.setTitle("\(experiment.duration)")
        rewardImageLabel.setTitle(experiment.reward)
        

    }
}