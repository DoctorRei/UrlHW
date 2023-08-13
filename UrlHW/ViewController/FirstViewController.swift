//
//  ViewController.swift
//  UrlHW
//
//  Created by Акира on 05.08.2023.
//

import UIKit

class FirstViewController: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Global Value
    
    var imageURL: URL?
    
    //MARK: - IBAction
    
    @IBAction func buttonGirlPressed() {
        let url = Links.animeGirls.url
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "I don't know bro sry")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let images = try decoder.decode(ModelJSonGirls.self, from: data)
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
    
    @IBAction func buttonBoyPressed() {
        let url = Links.animeBoys.url
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "I don't know bro sry")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let images = try decoder.decode(ModelJSonBoys.self, from: data)
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

extension FirstViewController {
    
    func getBoys() {
        
        
    }
    
    
    
}
