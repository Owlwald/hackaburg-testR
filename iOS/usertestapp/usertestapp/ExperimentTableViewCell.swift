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
    
    func setupLayout() {
        self.addSubview(outerStackView)
        outerStackView.addArrangedSubview(titleLabel)
        outerStackView.addArrangedSubview(detailStackView)
        
        detailStackView.addArrangedSubview(leftInnerDetailStackView)
        detailStackView.addArrangedSubview(rightInnerDetailStackView)
        
        leftInnerDetailStackView.addArrangedSubview(typeImageLabel)
        leftInnerDetailStackView
    }
    
    
}