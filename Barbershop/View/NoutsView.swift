
import UIKit
import SnapKit
import MapKit

class NoutsView: UIView {

    static let singltone = NoutsView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setConstraintElements()

    }

    lazy var segmentedController: UISegmentedControl = {
        var segmented = UISegmentedControl(items: ["Услуги","Контакты"])
        segmented.selectedSegmentIndex = 1
        segmented.backgroundColor = UIColor.gray
        segmented.layer.borderColor = UIColor.white.cgColor
        return segmented
    }()

    lazy var servicesScreenView: UIView = { // первый
        var viewChange = UIView()
        viewChange.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 0)
        return viewChange
    }()

    lazy var contactsScreenView: UIView = { // второй
        var viewCgangeSecpns = UIView()
        viewCgangeSecpns.backgroundColor = .white
        return viewCgangeSecpns
    }()



    let mapView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        let anotattion = MKPointAnnotation()
        anotattion.title = "Мы тут"
        anotattion.subtitle = "Ул. Ленина, 73 "
        anotattion.coordinate = CLLocationCoordinate2D(latitude: 49.62808, longitude: 41.72708)
        map.showAnnotations([anotattion], animated: true)
        map.camera.altitude *= 1.4
        map.addAnnotation(anotattion)
        return map
    }()

    lazy var addressForContactsScreen: UILabel = {
        var label = UILabel()
        label.text = "Адрес:"
        label.textColor = UIColor.gray
        return label
    }()
    lazy var addresSource: UILabel = {
        var label = UILabel()
        label.text = "Ул. Ленина, 73"
        label.textColor = UIColor.black
        return label
    }()


    lazy var  phoneForContactsScreen: UILabel = {
        var label = UILabel()
        //        label.text = "+7 915 004-78-08"
        label.text = "Телефон:"
        label.textColor = UIColor.gray
        return label
    }()

    lazy var phoneSource: UILabel = {
        var label = UILabel()
        label.text = "+7(961)272-77-05" //
        label.textAlignment = .left
        label.textColor = UIColor.black
        return label
    }()

    lazy var workingHoursForContactsScreen: UILabel = {
        var label = UILabel()
        label.text = "Время работы:"
        label.textColor = UIColor.gray
        return label
    }()

    lazy var workingHoursSource: UILabel = {
        var label = UILabel()
        label.text = "10.00 - 18:00"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    lazy  var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.register(CellServices.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setConstraintElements(){
        self.addSubview(segmentedController) // он в tabBar, поэтому можно не делать ему constraint

        //MARK:  - Это view для segmentedController
        self.addSubview(servicesScreenView)
        servicesScreenView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }

        self.addSubview(contactsScreenView)
        contactsScreenView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }


        //MARK: - Contacts Screen

        contactsScreenView.addSubview(mapView)
        mapView.snp.makeConstraints { make in

            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.snp_bottomMargin).inset(NoutsViewContoller.screnSize.height / 2)

        }

        contactsScreenView.addSubview(addressForContactsScreen)
        addressForContactsScreen.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(mapView.snp_bottomMargin).offset(30)
        }




        contactsScreenView.addSubview(phoneForContactsScreen)
        phoneForContactsScreen.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(addressForContactsScreen.snp_bottomMargin).offset(30)
        }


        contactsScreenView.addSubview(workingHoursForContactsScreen)
        workingHoursForContactsScreen.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(phoneForContactsScreen.snp_bottomMargin).offset(30)
        }


        contactsScreenView.addSubview(addresSource)
        addresSource.snp.makeConstraints { make in
            make.leading.equalTo(addressForContactsScreen.snp_trailingMargin).offset(NoutsViewContoller.screnSize.width / 5 )
            make.top.equalTo(mapView.snp_bottomMargin).offset(30)
        }


        contactsScreenView.addSubview(phoneSource)
        phoneSource.snp.makeConstraints { make in
            make.leading.equalTo(phoneForContactsScreen.snp_trailingMargin).offset((NoutsViewContoller.screnSize.width / 5) - 15 )
            make.top.equalTo(addresSource.snp_bottomMargin).offset(30)

        }


        contactsScreenView.addSubview(workingHoursSource)
        workingHoursSource.snp.makeConstraints { make in
            make.leading.equalTo(workingHoursForContactsScreen.snp_trailingMargin).offset((NoutsViewContoller.screnSize.width / 5) - 55)
            make.top.equalTo(phoneSource.snp_bottomMargin).offset(30)
        }


        //        servicesScreenView

        servicesScreenView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.trailing.leading.top.bottom.equalToSuperview()
        }




    }
}


