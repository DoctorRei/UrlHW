//
//  Extensions.swift
//  UrlHW
//
//  Created by Акира on 13.08.2023.
//

import Foundation
import UIKit

extension FirstViewController {
    
    //MARK: - JSON Decoding for images
    
    func setupImages(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "I don't know bro sry")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let images = try decoder.decode(JsonForPictures.self, from: data)
                self?.imageURL = URL(string: images.url)
                print(images)
                if let imageURL = self?.imageURL {
                    if let data = try? Data(contentsOf: imageURL) {
                        DispatchQueue.main.async {
                            self?.imageView.image = UIImage(data: data)
                        }
                    }
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    
}
