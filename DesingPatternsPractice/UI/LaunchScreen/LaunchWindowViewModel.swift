//
//  LaunchWindowViewModel.swift
//  DesingPatternsPractice
//
//  Created by Rodrigo Latorre on 5/08/22.
//

import Foundation

protocol LaunchWindowViewModelProtocol {
    
}

class LaunchWindowViewModel {
    private weak var viewDelegate: LaunchWindowViewControllerProtocol?
    
    init(viewDelegate: LaunchWindowViewControllerProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
}

extension LaunchWindowViewModel: LaunchWindowViewModelProtocol {
    
}
