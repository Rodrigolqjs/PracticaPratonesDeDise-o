//
//  launchWindowViewController.swift
//  DesingPatternsPractice
//
//  Created by Rodrigo Latorre on 5/08/22.
//

import UIKit

protocol SplashViewControllerProtocol: AnyObject {
    func getHeroesSplash(network: NetworkService, token: String, completion: @escaping () -> Void)
    func getToken(network: NetworkService, completion: @escaping () -> Void)
    func navigateToDBCharacters()
}

final class SplashViewController: UIViewController {
    
    var viewModel: SplashViewModelProtocol?
    var characters: [Character] = []
    var villains: [Villain] = []
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
    
    func getHeroesSplash(network: NetworkService, token: String, completion: @escaping () -> Void) {
        network.getCharacters(token: token, completion: { characters, error in
            characters.forEach { character in
                if(character.name == "Androide 17"  ||
                   character.name == "Célula"       ||
                   character.name == "Raditz"       ||
                   character.name == "Beerus"       ||
                   character.name == "Freezer"      ||
                   character.name == "Androide 18"
                   
                ) {
                    self.villains.append(Villain(id: character.id, name: character.name, description: character.description, photo: character.photo, favorite: character.favorite))
                    print(self.villains)
                } else {
                    self.heroes.append(Hero(id: character.id, name: character.name, description: character.description, photo: character.photo, favorite: character.favorite))
                    print(self.heroes)
                }
            }
                completion()
        })
    }
    
    func getToken(network: NetworkService, completion: @escaping () -> Void) {
        network.login { token, error in
            self.getHeroesSplash(network: network, token: token ?? "") {
                completion()
            }
        }
    }
    
    func navigateToDBCharacters() {
        let nextStoryboard = UIStoryboard(name: "DBCharacters", bundle: nil)
        guard let destinationVC = nextStoryboard.instantiateInitialViewController() as? DBTabBarViewController else { return }
        
        destinationVC.viewModel = DBTabBarViewModel(viewDelegate: destinationVC, heroes: self.heroes, villains: self.villains)
        DispatchQueue.main.async {
            self.navigationController?.setViewControllers([destinationVC], animated: true)
        }
    }
    
}

