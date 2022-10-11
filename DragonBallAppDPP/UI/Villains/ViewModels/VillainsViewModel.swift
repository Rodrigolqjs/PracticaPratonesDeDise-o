//
//  DBCharactersViewModel.swift
//  DragonBallAppDPP
//
//  Created by Rodrigo Latorre on 29/08/22.
//

import Foundation

protocol VillainsViewModelProtocol {
    var dataCount: Int { get }
    func onViewsLoaded()
    func data(for index: Int) -> Villain?
    func onItemSelectedAt(at index: Int)
    func getVillains()
}

class VillainsViewModel {
    
    var viewDelegate: VillainsViewControllerProtocol?
    var villains: [Villain]
    
    init(viewDelegate: VillainsViewControllerProtocol?, villains: [Villain]) {
        self.viewDelegate = viewDelegate
        self.villains = villains
    }
    
    func loadData() {
        
    }
    
}

extension VillainsViewModel: VillainsViewModelProtocol {
    var dataCount: Int {villains.count}
    
    func data(for index: Int) -> Villain? {
        guard index < dataCount else { return nil }
        return villains[index]
    }
    
    func onViewsLoaded() {
        loadData()
    }
    
    func onItemSelectedAt(at index: Int) {
        guard let data = data(for: index) else { return print("no data")}
        viewDelegate?.navigateToDetail(with: data)
    }
    
    func getVillains() {
        
    }
}
