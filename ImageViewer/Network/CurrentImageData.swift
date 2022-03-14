//
//  CurrentImageData.swift
//  ImageViewer
//
//  Created by Михаил on 10.03.2022.
//

import Foundation

struct CurrentImageData : Decodable {
    
    private enum CodingKeys : String, CodingKey {
        case createdAt = "created_at", urls, id
    }
    
    let createdAt: String
    let urls: PhotoUrls
    let id: String
}

struct PhotoUrls: Decodable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    
    init(raw: String, full: String, regular: String,small: String) {
        self.raw = raw
        self.full = full
        self.regular = regular
        self.small = small
    }
}
