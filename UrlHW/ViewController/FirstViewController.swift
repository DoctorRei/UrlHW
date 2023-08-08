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
    
    var imageURL: URL?
    
    //MARK: - IBAction
    
    @IBAction func buttonPressed() {
        guard let url = URL(string: Links.nekoImage.rawValue) else { return}
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "I don't know bro sry")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let images = try decoder.decode(ModelJSon.self, from: data)
                self?.imageURL = URL(string: images.url)
                print(images)
                DispatchQueue.main.async {
                    if let imageURL = self?.imageURL {
                        if let data = try? Data(contentsOf: imageURL) {
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

