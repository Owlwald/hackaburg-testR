//
//  DetailLabel.swift
//  usertestapp
//
//  Created by Hans-Martin Schuller on 16.04.16.
//  Copyright © 2016 hackaburg2016. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class DetailLabel: UIView {
    let outerStackView = UIStackView(forAutoLayout: ())
    let typeLabel = BaseLabel(forAutoLayout: ())
    let contentLabel = BaseLabel(forAutoLayout: ())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        typeLabel.text = "init"
        contentLabel.text = "init"
        
        self.addSubview(outerStackView)
        outerStackView.autoPinEdgesToSuperviewEdges()
        outerStackView.addArrangedSubview(typeLabel)
        outerStackView.addArrangedSubview(contentLabel)
        
        outerStackView.axis = .Horizontal
        outerStackView.distribution = .FillEqually
        outerStackView.alignment = .Fill
        outerStackView.spacing = 8
    }
    
    func setTypeDescription(text: String) {
        typeLabel.text = text
    }
    
    func setContent(text: String) {
        contentLabel.text = text
    }
}