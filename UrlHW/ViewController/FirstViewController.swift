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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        imageView.isUserInteractionEnabled = true
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapImage)
        
    }
    
    //MARK: - View Did Appear
    
    override func viewDidAppear(_ animated: Bool) {
        presentAlert(
            withTitle: AlertMessages.shared.title,
            message: AlertMessages.shared.message)
    }
    
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
        prepareToChangeImg()
        
        let url = Links.animeBoys.url
        setupImages(from: url)
        
        setupUI()
    }
    
    private func setupGirls() {
        prepareToChangeImg()
        
        let url = Links.animeGirls.url
        setupImages(from: url)
        setupUI()
        
    }
    
    private func setupUI() {
        
        DispatchQueue.main.async {
            self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2
            self.imageView.clipsToBounds = true
            self.activityIndicator.stopAnimating()
        }
    } // Мне нужно скруглить края после того, как у меня будет изображение.
    // У меня не получилось отобразить активитииндкатор в момент, когда меняется изобьражение. Думал, что это связано с рассинхроном потоков. Но больше похоже, что активити индикатор тупо не запускаеся
    
    private func prepareToChangeImg(){
        imageView.image = nil
        activityIndicator.hidesWhenStopped = true
        
    }
    
    @objc func imageTapped() {
        guard let imageForCopy = imageURL else { return }
        UIPasteboard.general.url = imageForCopy
    }
    
   //MARK: - Alert Controller
    
    private func presentAlert(withTitle title: String, message : String) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let girlAction = UIAlertAction(title: "Девочка", style: .default) { [weak self] _ in
            self?.setupGirls()
        }
        
        let boyAction = UIAlertAction(title: "Мальчик", style: .default) { [weak self] _ in
            self?.setupBoys()
        }
        
        
        alertController.addAction(girlAction)
        alertController.addAction(boyAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}





