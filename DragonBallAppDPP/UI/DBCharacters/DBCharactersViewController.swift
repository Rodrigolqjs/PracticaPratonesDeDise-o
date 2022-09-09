//
//  DBCharactersViewController.swift
//  DragonBallAppDPP
//
//  Created by Rodrigo Latorre on 25/08/22.
//

import UIKit

protocol DBCharactersViewControllerProtocol {
}

class DBCharactersViewController: UIViewController {
    
    var viewModel: DBCharactersViewModelProtocol?
    var networkService: NetworkService?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }

}

extension DBCharactersViewController: DBCharactersViewControllerProtocol {
}
