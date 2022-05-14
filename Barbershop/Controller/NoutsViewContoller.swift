
import UIKit
import SnapKit
import MapKit

class NoutsViewContoller: UIViewController {

    //MARK: !! благодаря ей все экарны динамические !!
    static  let screnSize = UIScreen.main.bounds 
    
    fileprivate lazy var viewSource = NoutsView()// источник view данных для нашего controllera

    // данные для ячейки
    var dataService: [ServicesModel] =
    [
        ServicesModel(image: "second", titile: "Стрижка головы", price: "500"),
        ServicesModel(image: "first", titile: "Cтрижка бороды", price: "400")
    ]
    

    //MARK: - laodView()
    override func loadView() {
        super.loadView()
        self.view = viewSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = viewSource.segmentedController
        viewSource.segmentedController.selectedSegmentIndex = 1
        //MARK: - Подключаем делагаты для collectionView
        viewSource.collectionView.delegate        = self
        viewSource.collectionView.dataSource      = self


        ConstantAndAnyFunc.setColorSettings(navigationController: navigationController!, tabBarController: tabBarController! as! TabBarController, colorOne: .white, colorTwo: .black)
    }

    //MARK: - viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewSource.segmentedController.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged) // добавил действие по нажатие на элемент segmented
    }

    //MARK: - действие по нажатию на segmented
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            DispatchQueue.main.async { [self] in
                viewSource.servicesScreenView.isHidden = false
                viewSource.contactsScreenView.isHidden = true
            }
        case 1:
            DispatchQueue.main.async { [self] in
                viewSource.servicesScreenView.isHidden = true
                viewSource.contactsScreenView.isHidden = false
            }
        default:
            break
        }
    }
}


//MARK: - CollectionView
extension NoutsViewContoller: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize{
        return CGSize(width: view.frame.width / 1.1,  height: view.frame.height / 2.2 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataService.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellServices
        cell.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        cell.layer.cornerRadius = 10
        cell.imageCervices.image = UIImage(named: dataService[indexPath.row].image)
        cell.titleLabel.text = dataService[indexPath.row].titile
        cell.priceLabel.text = dataService[indexPath.row].price + " ₽"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:5, left: 16, bottom: 10, right: 16)
    }
}



