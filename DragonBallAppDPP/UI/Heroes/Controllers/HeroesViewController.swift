
import UIKit

protocol HeroesViewControllerProtocol {
    func configureViews()
    func navigateToDetail(with data: Hero?)
}

class HeroesViewController: UIViewController {

    @IBOutlet weak var heroesCollectionView: UICollectionView!
    
    
    var viewModel: HeroesViewModelProtocol?
    var networkService: NetworkService?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.onViewsLoaded()
        configureViews()
    }
}


extension HeroesViewController: HeroesViewControllerProtocol {
    func configureViews() {
        heroesCollectionView.delegate = self
        heroesCollectionView.dataSource = self
    }
    
    func navigateToDetail(with data: Hero?) {
        let nextSB = UIStoryboard(name: "Detail", bundle: nil)
        guard let viewData = data,
              let destination = nextSB.instantiateInitialViewController() as? DetailViewController else { return }

        destination.viewModel = DetailViewModel(viewDelegate: destination, data: viewData)

        navigationController?.pushViewController(destination, animated: true)
    }
}


extension HeroesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width / 2) - 8,
               height: 160.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        viewModel?.dataCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellView",
                                                      for: indexPath) as? CellView

        if let data = viewModel?.data(for: indexPath.row) {
            cell?.updateViews(data: data)
        }

        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.onItemSelectedAt(at: indexPath.row)
    }
    
}

