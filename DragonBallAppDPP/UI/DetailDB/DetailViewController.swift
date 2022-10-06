//
//  DetailViewController.swift
//  DragonBallAppDPP
//
//  Created by Rodrigo Latorre on 5/10/22.
//

import UIKit

protocol DetailViewControllerProtocol {
    func updateViews(data: Hero)
}

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.onViewsLoaded()
    }
    
}

extension DetailViewController: DetailViewControllerProtocol {
    func updateViews(data: Hero) {
        self.imageView.setImage(url: data.photo)
        self.heroName.text = data.name
        self.heroDescription.text = data.description
    }
}
