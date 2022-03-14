//
//  BaseView.swift
//  ImageViewer
//
//  Created by Михаил on 11.03.2022.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    final func setupUI() {
        setupViewHierarchy()
        setupConstraints()
        didSetupView()
    }
    
    open func setupViewHierarchy() {}
    
    open func setupConstraints() {}
    
    open func didSetupView() {}
}
