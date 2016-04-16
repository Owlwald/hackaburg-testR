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
    let timeImageLabel = DetailImageLabel(forAutoLayout: ())

    
    // ImageLabels right
    let rewardImageLabel = DetailImageLabel(forAutoLayout: ())
    let locationImageLabel = DetailImageLabel(forAutoLayout: ())


    
    func setupLayout() {
        self.layoutMargins = UIEdgeInsetsMake(8, 8, 8, 8)
        self.layoutMarginsRelativeArrangement = true
        self.addArrangedSubview(leftInnerDetailStackView)
        self.addArrangedSubview(rightInnerDetailStackView)
        
        self.axis = .Horizontal
        self.spacing = 16
        self.distribution = .FillEqually
        self.alignment = .Center
        
        leftInnerDetailStackView.addArrangedSubview(typeImageLabel)
        leftInnerDetailStackView.addArrangedSubview(durationImageLabel)
        leftInnerDetailStackView.addArrangedSubview(timeImageLabel)
        
        rightInnerDetailStackView.addArrangedSubview(rewardImageLabel)
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
        durationImageLabel.setImage("icon_duration")
        typeImageLabel.setImage("icon_category")
        timeImageLabel.setImage("icon_time_frame")
        locationImageLabel.setImage("icon_location")
        rewardImageLabel.setImage("icon_reward")
        
        typeImageLabel.setTitle(experiment.type)
        timeImageLabel.setTitle(experiment.startDate.displayFormat)
        locationImageLabel.setTitle(experiment.location)
        durationImageLabel.setTitle("\(experiment.duration)")
        rewardImageLabel.setTitle(experiment.reward)
        

    }
}