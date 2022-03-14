//
//  ListImagesView.swift
//  ImageViewer
//
//  Created by Михаил on 11.03.2022.
//

import UIKit

class ListImagesView: BaseView {
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func setupViewHierarchy() {
        addSubview(collectionView)
    }
    
    override func didSetupView() {
        collectionView.backgroundColor = .clear
        backgroundColor = .white
        
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        let topCollectionView = collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        
        let bottomCollectionView = NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let leftCollectionView = NSLayoutConstraint(item: collectionView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0)
        
        let rightCollectionView = NSLayoutConstraint(item: collectionView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0)
        
        addConstraints([topCollectionView, bottomCollectionView, leftCollectionView, rightCollectionView])
        
    }
}
