
import Foundation

protocol DBTabBarViewModelProtocol {
    func onViewsLoaded()
    func getHeroes() -> [Hero]
    func getVillains() -> [Villain]
}

class DBTabBarViewModel {
    
    var viewDelegate: DBTabBarViewControllerProtocol?
    var heroes: [Hero]
    var villains: [Villain]
    
    init(viewDelegate: DBTabBarViewControllerProtocol?, heroes: [Hero], villains: [Villain]) {
        self.viewDelegate = viewDelegate
        self.heroes = heroes
        self.villains = villains
    }
    func loadData() {
        viewDelegate?.loadTabs()
    }
}

extension DBTabBarViewModel: DBTabBarViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
    
    func getHeroes() -> [Hero] {
        return self.heroes
    }
    
    func getVillains() -> [Villain] {
        return self.villains
    }
}
