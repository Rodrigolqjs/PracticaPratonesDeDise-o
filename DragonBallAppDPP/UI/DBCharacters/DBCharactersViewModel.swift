//
//  DBCharactersViewModel.swift
//  DragonBallAppDPP
//
//  Created by Rodrigo Latorre on 29/08/22.
//

import Foundation

protocol DBCharactersViewModelProtocol {
    func onViewsLoaded()
}

class DBCharactersViewModel {
    
    var viewDelegate: DBCharactersViewControllerProtocol?
    var heroes: [Hero]
    
    init(viewDelegate: DBCharactersViewControllerProtocol?, heroes: [Hero]) {
        self.viewDelegate = viewDelegate
        self.heroes = heroes
    }
    
    func loadData() {
        print(heroes)
    }
    
}

extension DBCharactersViewModel: DBCharactersViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
}
