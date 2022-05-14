
import Foundation
import UIKit

final class GalleryViewController: UIViewController {
    
    fileprivate lazy var gallerySource = GalleryView() // источник view

    //MARK: - loadView()
    override func loadView() {
        super.loadView()
        self.view = gallerySource
    }

    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

        // подключаем delegate
        gallerySource.collectionView.delegate = self
        gallerySource.collectionView.dataSource = self

        ConstantAndAnyFunc.setColorSettings(navigationController: navigationController!, tabBarController: tabBarController! as! TabBarController, colorOne: .white, colorTwo: .black)
    }
}


 //MARK: - Все для CollectionView()
extension GalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize{
        
        return CGSize(width: view.frame.width / 1.1,  height: view.frame.height / 2.2 )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ModelCollection.newPhoto.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! GalleryCollectionViewCell
        cell.myImgaeView.image = ModelCollection.newPhoto[indexPath.row].imagePhoto
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        cell.backgroundColor = .gray
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:5, left: 16, bottom: 10, right: 16)
    }
    
}
