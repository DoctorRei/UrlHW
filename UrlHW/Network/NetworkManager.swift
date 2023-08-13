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
    
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let dataModel = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.DecodingError))
            }
            
        }.resume()
    }
    
    
    
}
