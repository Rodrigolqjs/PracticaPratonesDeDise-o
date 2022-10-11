//
//  DBTabBarController.swift
//  DragonBallAppDPP
//
//  Created by Rodrigo Latorre on 6/10/22.
//

import UIKit

protocol DBTabBarViewControllerProtocol {
    func loadTabs()
}

class DBTabBarViewController: UITabBarController {
    
    var viewModel: DBTabBarViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }

}

extension DBTabBarViewController: DBTabBarViewControllerProtocol {
    
    func loadTabs() {
        let heroesSB = UIStoryboard(name: "Heroes", bundle: nil)
        guard let heroesVC = heroesSB.instantiateInitialViewController() as? HeroesViewController else { return print("no se pudo castear a VC Heroes") }
        guard let heroes = viewModel?.getHeroes() else { return print("no heroes") }
        heroesVC.viewModel = HeroesViewModel(viewDelegate: heroesVC, heroes: heroes)
        heroesVC.title = "Heroes"
        heroesVC.tabBarItem.image = UIImage(systemName: "face.smiling")
        
        let villainsSB = UIStoryboard(name: "Villains", bundle: nil)
        guard let villainsVC = villainsSB.instantiateInitialViewController() as? VillainsViewController else { return print("no se pudo castear a VC Villains") }
        guard let villains = viewModel?.getVillains() else { return print("no villains") }
        villainsVC.viewModel = VillainsViewModel(viewDelegate: villainsVC, villains: villains)
        villainsVC.title = "Villains"
        villainsVC.tabBarItem.image = UIImage(systemName: "face.dashed")
        self.setViewControllers([heroesVC, villainsVC], animated: false)
    }
}

