//
//  DetailStackView.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import UIKit

class DetailStackView: UIView {
    
    let detailStackView = UIStackView(forAutoLayout: ())
    let leftInnerDetailStackView = UIStackView(forAutoLayout: ())
    let rightInnerDetailStackView = UIStackView(forAutoLayout: ())
    
    // ImageLabels left
    let typeImageLabel = DetailImageLabel(forAutoLayout: ())
    let durationImageLabel = DetailImageLabel(forAutoLayout: ())
    let timeImageLabel = DetailImageLabel(forAutoLayout: ())

    
    // ImageLabels right
    let rewardImageLabel = DetailImageLabel(forAutoLayout: ())
    let locationImageLabel = DetailImageLabel(forAutoLayout: ())

    // SpacerView
    
    let spacerViewTop = UIView(forAutoLayout: ())
    let spacerViewBottom = UIView(forAutoLayout: ())

    
    func setupLayout() {
        self.addSubview(detailStackView)
        detailStackView.autoPinEdgesToSuperviewEdges()
        
        detailStackView.layoutMargins = UIEdgeInsetsMake(0, 16, 0, 16)
        detailStackView.layoutMarginsRelativeArrangement = true
        detailStackView.addArrangedSubview(leftInnerDetailStackView)
        detailStackView.addArrangedSubview(rightInnerDetailStackView)
        
        detailStackView.axis = .Horizontal
        detailStackView.spacing = 16
        detailStackView.distribution = .FillEqually
        detailStackView.alignment = .Center
        
        leftInnerDetailStackView.addArrangedSubview(typeImageLabel)
        leftInnerDetailStackView.addArrangedSubview(durationImageLabel)
        leftInnerDetailStackView.addArrangedSubview(timeImageLabel)
        
        rightInnerDetailStackView.addArrangedSubview(rewardImageLabel)
        rightInnerDetailStackView.addArrangedSubview(locationImageLabel)
        
        leftInnerDetailStackView.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        leftInnerDetailStackView.layoutMarginsRelativeArrangement = true
        
        rightInnerDetailStackView.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        rightInnerDetailStackView.layoutMarginsRelativeArrangement = true
        
        spacerViewTop.autoSetDimension(.Height, toSize: 2)
        spacerViewTop.backgroundColor = UIColor.lightGrayColor()
        spacerViewBottom.autoSetDimension(.Height, toSize: 2)
        spacerViewBottom.backgroundColor = UIColor.lightGrayColor()
        
        detailStackView.addSubview(spacerViewTop)
        detailStackView.addSubview(spacerViewBottom)
        
        spacerViewTop.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Bottom)
        spacerViewBottom.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Top)
        
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