//
//  launchWindowViewController.swift
//  DesingPatternsPractice
//
//  Created by Rodrigo Latorre on 5/08/22.
//

import UIKit

protocol SplashViewControllerProtocol: AnyObject {
    func getHeroesSplash(network: NetworkService, token: String)
    func getToken(network: NetworkService)
    func navigateToDBCharacters()
}

final class SplashViewController: UIViewController {
    
    var viewModel: SplashViewModelProtocol?
    var heroes: [Hero] = []
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator?.stopAnimating()
    }
}

extension SplashViewController: SplashViewControllerProtocol {
    
    func getHeroesSplash(network: NetworkService, token: String) {
        network.getHeroes(token: token, completion: { heroes, error in
                self.heroes = heroes
            print(self.heroes)
        })
    }
    
    func getToken(network: NetworkService) {
        network.login { token, error in
                self.getHeroesSplash(network: network, token: token ?? "")
        }
    }
    
    func navigateToDBCharacters() {
        let nextStoryboard = UIStoryboard(name: "DBCharacters", bundle: nil)
        
        guard let destinationVC = nextStoryboard.instantiateInitialViewController() as? DBCharactersViewController else { return }
        
        destinationVC.viewModel = DBCharactersViewModel(viewDelegate: destinationVC, heroes: self.heroes)
        
        DispatchQueue.main.async {
            self.navigationController?.setViewControllers([destinationVC], animated: true)
        }
    }
    
}

