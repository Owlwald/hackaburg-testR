//
//  DetailImageLabel.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class DetailImageLabel: UIView {
    let outerStackView = UIStackView(forAutoLayout: ())
    let imageView = UIImageView(forAutoLayout: ())
    let label = SubtitleLabel(forAutoLayout: ())
    
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
        outerStackView.addArrangedSubview(imageView)
        outerStackView.addArrangedSubview(label)
        outerStackView.axis = .Horizontal
        outerStackView.distribution = .EqualSpacing
        outerStackView.alignment = .Leading
        outerStackView.spacing = 8
    }
    
    func setTitle(title: String) {
        label.text? = title
    }
    
    func setImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}