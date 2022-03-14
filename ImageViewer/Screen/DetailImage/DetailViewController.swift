//
//  DetailViewController.swift
//  ImageViewer
//
//  Created by Михаил on 10.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    let rootView = DetailView()
    var image: CurrentImageData?
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = image?.id
        
        if let imageUrlString = image?.urls.full {
            rootView.detailImage.loadImage(imageUrlString)
        }
        rootView.detailInfo.text = image?.createdAt
    }
}
