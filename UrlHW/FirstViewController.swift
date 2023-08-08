//
//  ViewController.swift
//  UrlHW
//
//  Created by Акира on 05.08.2023.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
   
    
    

    
    
    
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
                print(images)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }

}

