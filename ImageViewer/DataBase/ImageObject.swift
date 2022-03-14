//
//  ImageObject.swift
//  ImageViewer
//
//  Created by Михаил on 13.03.2022.
//

import Foundation
import RealmSwift

class ImageObject: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var createdAt = ""
    @objc dynamic var small = ""
    @objc dynamic var full = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
