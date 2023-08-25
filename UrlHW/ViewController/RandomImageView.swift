//
//  ViewController.swift
//  UrlHW
//
//  Created by Акира on 05.08.2023.
//

import UIKit

class RandomImageView: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActivityIndicator()
        setupImageView()
        
        view.backgroundColor = .systemGray4
    }
    
    //MARK: - View Did Appear
    
    override func viewDidAppear(_ animated: Bool) {
        showGuideAlert(
            withTitle: AlertMessages.shared.title,
            message: AlertMessages.shared.message)
        NetworkManager.shared.getJsonForPicture() // <------------- вот тут проверяем, сработало или нет. Сработало
    }
    
    //MARK: - Heart of this App. URL from API. Contains random art
    
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
    }
    
    private func prepareToChangeImg(){
        imageView.image = nil
        activityIndicator.startAnimating()
    }
    
    private func setupImageView() {
        imageView.isUserInteractionEnabled = true
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapImage)
    }
    
    private func setupActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    //MARK: - Objc methods
    
    @objc func imageTapped() {
        guard let imageForCopy = imageURL else { return }
        UIPasteboard.general.url = imageForCopy
        showCopyAlert(
            withTitle: AlertMessages.shared.tileForCopy,
            message: AlertMessages.shared.messageForCopy)
    }
    
   //MARK: - Alert Controller
    
    private func showGuideAlert(withTitle title: String, message : String) {
        
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





