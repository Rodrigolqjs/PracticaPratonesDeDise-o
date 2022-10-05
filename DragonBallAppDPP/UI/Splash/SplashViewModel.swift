
import Foundation

protocol SplashViewModelProtocol {
    func onViewsLoaded()
}

class SplashViewModel {
    
    private weak var viewDelegate: SplashViewControllerProtocol?
    var networkService = NetworkService()
    
    init(viewDelegate: SplashViewControllerProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    func loadData() {
        viewDelegate?.getToken(network: networkService, completion: {
            self.viewDelegate?.navigateToDBCharacters()
        })
    }
}

extension SplashViewModel: SplashViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
}
