
import Foundation

protocol HeroesViewModelProtocol {
    var dataCount: Int { get }
    func onViewsLoaded()
    func data(for index: Int) -> Hero?
    func onItemSelectedAt(at index: Int)
    func getHeroes()
}

class HeroesViewModel {
    
    var viewDelegate: HeroesViewControllerProtocol?
    var heroes: [Hero]
    
    init(viewDelegate: HeroesViewControllerProtocol?, heroes: [Hero]) {
        self.viewDelegate = viewDelegate
        self.heroes = heroes
    }
    
    func loadData() {
        
    }
    
}

extension HeroesViewModel: HeroesViewModelProtocol {
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
    
    func getHeroes() {

    }
    
}

