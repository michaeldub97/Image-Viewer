//
//  PhotoCollectionViewCell.swift
//  ImageViewer
//
//  Created by Михаил on 09.03.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let labelInfo : UILabel = {
        let labelInfo = UILabel()
        labelInfo.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        labelInfo.textColor = .white
        labelInfo.textAlignment = .center
        labelInfo.font = labelInfo.font.withSize(12)
        return labelInfo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.addSubview(labelInfo)
        setupConstraintImageView()
        setupConstrainsLabelInfo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func setupConstraintImageView() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let topImageView = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0)
        
        let leftImageView = NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0)
        
        let rightImageView = NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: 0)
        
        let bottomImageView = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        contentView.addConstraints([topImageView, leftImageView, rightImageView, bottomImageView])
    }
    
    func setupConstrainsLabelInfo() {
        
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        
        let topLabelInfo = NSLayoutConstraint(item: labelInfo, attribute: .bottom, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let leftLabelInfo = NSLayoutConstraint(item: labelInfo, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0)
        
        let rightLabelInfo = NSLayoutConstraint(item: labelInfo, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: 0)
        
        contentView.addConstraints([topLabelInfo, leftLabelInfo, rightLabelInfo])
    }
    
}
