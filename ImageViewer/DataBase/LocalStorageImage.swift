//
//  LocalStorageImage.swift
//  ImageViewer
//
//  Created by Михаил on 13.03.2022.
//

import Foundation
import RealmSwift

class LocalStorageImage {
    
    let realm = try! Realm()
    static let shared = LocalStorageImage()
    
    func saveImages(images : [CurrentImageData]) {
        removeAllImages()
        let objects = convert(images)
        saveImages(objects)
    }
    
    private func removeAllImages() {
        let result = realm.objects(ImageObject.self)
        try! realm.write {
            realm.delete(result)
        }
    }
    
    private func saveImages(_ objects: [ImageObject]) {
        try! realm.write {
            realm.add(objects)
        }
    }
    
    private func convert(_ image: CurrentImageData) -> ImageObject {
        let object = ImageObject()

        object.id = image.id
        object.createdAt = image.createdAt
        object.small = image.urls.small
        object.full = image.urls.full
        
        return object
    }

    private func convert(_ images: [CurrentImageData]) -> [ImageObject] {
        var data: [ImageObject] = []
        for image in images {
            let object = convert(image)
            data.append(object)
        }
        return data
    }
    
    func getAllImages() -> [CurrentImageData] {
        let imagesObjects = realm.objects(ImageObject.self)
        var images: [CurrentImageData] = []
        for object in imagesObjects {
            let id = object.id
            let createdAt = object.createdAt
            let small = object.small
            let full = object.full
            let urls = PhotoUrls(raw: "", full: full, regular: "", small: small)
            let data = CurrentImageData(createdAt: createdAt,
                                        urls: urls,
                                        id: id)
            images.append(data)
            
        }
        return images
    }
}
