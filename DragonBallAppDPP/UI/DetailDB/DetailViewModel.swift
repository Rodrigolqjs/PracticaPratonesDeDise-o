//
//  DetailViewModel.swift
//  DragonBallAppDPP
//
//  Created by Rodrigo Latorre on 5/10/22.
//

import Foundation

protocol DetailViewModelProtocol {
    func onViewsLoaded()
}

class DetailViewModel {
    
    var viewDelegate: DetailViewController?
    var viewData: Hero
    
    init(viewDelegate: DetailViewController, data: Hero) {
        self.viewDelegate = viewDelegate
        self.viewData = data
    }
}

extension DetailViewModel: DetailViewModelProtocol {
    func onViewsLoaded() {
        viewDelegate?.updateViews(data: viewData)
    }
}
