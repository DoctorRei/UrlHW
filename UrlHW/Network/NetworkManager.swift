//
//  NetworkManager.swift
//  UrlHW
//
//  Created by Акира on 13.08.2023.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case DecodingError
}


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }.resume()
    }
    
    func iHateThis() {
        
    }
    
    
}
