//
//  UIImage+Extensions.swift
//  HotelSwift
//
//  Created by Михаил on 18.02.2022.
//


import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(_ urlString: String) {
        let url = URL(string: urlString)
        var kf = self.kf
        kf.indicatorType = .activity
        
        kf.setImage(with: url, options: [.transition(.fade(0.2))])
       
    }
    
    func loadImage(url: URL) {
        var kf = self.kf
        kf.indicatorType = .activity
        kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
}
