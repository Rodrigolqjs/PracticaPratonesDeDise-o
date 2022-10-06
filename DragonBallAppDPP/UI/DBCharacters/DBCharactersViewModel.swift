//
//  DBCharactersViewModel.swift
//  DragonBallAppDPP
//
//  Created by Rodrigo Latorre on 29/08/22.
//

import Foundation

protocol DBCharactersViewModelProtocol {
    var dataCount: Int { get }
    func onViewsLoaded()
    func data(for index: Int) -> Hero?
    func onItemSelectedAt(at index: Int)
}

class DBCharactersViewModel {
    
    var viewDelegate: DBCharactersViewControllerProtocol?
    var heroes: [Hero]
    
    init(viewDelegate: DBCharactersViewControllerProtocol?, heroes: [Hero]) {
        self.viewDelegate = viewDelegate
        self.heroes = heroes
    }
    
    func loadData() {
    }
    
}

extension DBCharactersViewModel: DBCharactersViewModelProtocol {
    var dataCount: Int {heroes.count}
    
    func data(for index: Int) -> Hero? {
        guard index < dataCount else { return nil }
        return heroes[index]
    }
    
    func onViewsLoaded() {
        loadData()
    }
    
    func onItemSelectedAt(at index: Int) {
        guard let data = data(for: index) else { return print("no data")}
        viewDelegate?.navigateToDetail(with: data)
    }
}
