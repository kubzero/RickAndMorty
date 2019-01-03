//
//  ImageViewController.swift
//  rrick
//
//  Created by Andrew on 03/10/2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var actionIndicator: UIActivityIndicatorView!
    private let url = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.clear
        actionIndicator.startAnimating()
        actionIndicator.hidesWhenStopped = true
        fetchImage()
    }
    
    
    private func fetchImage() {
        navigationController?.navigationBar.isHidden = false
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.actionIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }
}
