
import UIKit

class CellView: UICollectionViewCell {
//    static var cellIdentifier: String {
//        String(describing: CellView.self)
//    }


    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()

        cellImage.layer.cornerRadius = 4.0
        cellView.layer.cornerRadius = 4.0
        cellView.layer.shadowColor = UIColor.gray.cgColor
        cellView.layer.shadowOffset = .zero
        cellView.layer.shadowOpacity = 0.7
        cellView.layer.shadowRadius = 4.0
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        cellImage.image = nil
        cellName.text = nil
    }

    func updateViews(data: Character) {
        self.cellImage.setImage(url: data.photo)
        self.cellName.text = data.name
    }

}

extension UIImageView {
    func setImage(url: URL) {
      downloadImageWithUrlSession(url: url) { [weak self] image in
        DispatchQueue.main.async {
          self?.image = image
        }
      }
    }
    
    private func downloadImageWithUrlSession(url: URL, completion: ((UIImage?) -> Void)?) {
      URLSession.shared.dataTask(with: url) { data, _, _ in
        guard let data = data,
              let image = UIImage(data: data)
        else {
          completion?(nil)
          return
        }
        completion?(image)
      }.resume()
    }
}
