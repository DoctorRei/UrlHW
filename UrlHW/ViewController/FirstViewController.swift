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
        setupGirls()
    }
    
    @IBAction func buttonBoyPressed() {
        setupBoys()
    }
    
    //MARK: - Private Methods
    
    private func setupBoys() {
        
        let url = Links.animeBoys.url
        
        setupImages(from: url)
        
    }
    
    private func setupGirls() {
        
        let url = Links.animeGirls.url
        
        setupImages(from: url)
        
    }
    
}




