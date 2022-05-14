
import Foundation
import SnapKit
import UIKit

final class CellServices: UICollectionViewCell {
    
    lazy var imageCervices: UIImageView = {
        var imageView = UIImageView()
        contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.backgroundColor = .clear
        return label
    }()

    lazy var priceLabel: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintElement()
        imageCervices.layer.cornerRadius = 20
    }
    
    func constraintElement(){

        contentView.addSubview(imageCervices)
        imageCervices.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(contentView.frame.width / 6)
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageCervices.snp_bottomMargin).offset(14)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(contentView.bounds.width / 2 - 10)
        }
        
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(imageCervices.snp_bottomMargin).offset(20)
        }
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
