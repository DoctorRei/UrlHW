//
//  NetworkManager.swift
//  UrlHW
//
//  Created by Акира on 13.08.2023.
//

import Foundation
import UIKit
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case DecodingError
}


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    
    func fetch<T: Decodable>(
        _ type: T.Type,
        from url: URL,
        completion: @escaping(Result<T, NetworkError>) -> Void) {
            
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
    
    func fetchData(from url: URL, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func getJsonForPicture() {
        AF.request(Links.animeGirls.url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                    
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let picture = try decoder.decode(JsonForPictures.self, from: data)
                        print(picture.url)
                    } catch {
                        print(error)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    
    
}
