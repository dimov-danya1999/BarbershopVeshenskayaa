
import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    static let reuseId = "cell"

    let myImgaeView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintImage()

    }

    private func constraintImage() {
        contentView.addSubview(myImgaeView)
        myImgaeView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
