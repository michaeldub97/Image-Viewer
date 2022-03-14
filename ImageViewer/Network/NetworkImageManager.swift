//
//  NetworkImageManager.swift
//  ImageViewer
//
//  Created by Михаил on 10.03.2022.
//

import Foundation

struct NetworkImageManager {
    
    private let baseUrlString = "https://api.unsplash.com"
    private let apiKey = "2DdrOokPCxWEYw3nxJi7OQbH3ZXcLhMX2cGRN--jgKs"
    
    func fetchImages(result: @escaping (Result<[CurrentImageData], Error>) -> Void) {
        
        let urlString = baseUrlString + "/photos?per_page=30&client_id=\(apiKey)"
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "fetchCurrentImage", code: -1, userInfo: [:])
            result(.failure(error))
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let images = try decoder.decode([CurrentImageData].self, from: data)
                    result(.success(images))
                } catch let error as NSError {
                    result(.failure(error))
                }
            } else {
                let error = error ?? NSError(domain: "fetchCurrentImage", code: -1, userInfo: [:])
                result(.failure(error))
            }
        }
        task.resume()
    }
}
