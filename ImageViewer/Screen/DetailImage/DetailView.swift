//
//  DetailView.swift
//  ImageViewer
//
//  Created by Михаил on 11.03.2022.
//

import UIKit

class DetailView: BaseView {
    
    let detailImage: UIImageView = {
        let detailImage = UIImageView()
        detailImage.backgroundColor = .lightGray
        detailImage.contentMode = .scaleAspectFill
        detailImage.clipsToBounds = true
        return detailImage
    }()
    
    let detailInfo: UILabel = {
        let detailInfo = UILabel()
        detailInfo.backgroundColor = .lightGray
        return detailInfo
    }()
    
    override func setupViewHierarchy() {
        addSubview(detailImage)
        addSubview(detailInfo)
    }
    
    override func didSetupView() {

        backgroundColor = .white
    }
    override func setupConstraints() {
        setupConstraintDetailImage()
        setupConstraintDetailInfo()
    }
    
    private func setupConstraintDetailImage() {

        detailImage.translatesAutoresizingMaskIntoConstraints = false
        
        let topDetailImage = detailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        
        let leftDetailImage = NSLayoutConstraint(item: detailImage, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0)
        
        let rightDetailImage = NSLayoutConstraint(item: detailImage, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0)
        
        let heightDetailImage = NSLayoutConstraint(item: detailImage, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.80, constant: 0.0)
        
        addConstraints([topDetailImage, leftDetailImage, rightDetailImage, heightDetailImage])
    }
    
    private func setupConstraintDetailInfo() {
        
        detailInfo.translatesAutoresizingMaskIntoConstraints = false
        
        let topDetailInfo = NSLayoutConstraint(item: detailInfo, attribute: .top, relatedBy: .equal, toItem: detailImage, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let leftDetailInfo = NSLayoutConstraint(item: detailInfo, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0)
        
        let rightDetailInfo = NSLayoutConstraint(item: detailInfo, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0)
        
        let bottomDetailInfo = NSLayoutConstraint(item: detailInfo, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        addConstraints([topDetailInfo, leftDetailInfo, rightDetailInfo, bottomDetailInfo])
    }
}
 
