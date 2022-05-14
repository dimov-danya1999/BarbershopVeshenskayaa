
import UIKit

class TabBarController: UITabBarController {

    //MARK:  - что бы был, только вертикальный режим
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       AppUtility.lockOrientation(.portrait)
   }
   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       AppUtility.lockOrientation(.all)
   }

    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .black

        tabBarController()
        self.selectedIndex = 1

    }
    // найстроки tabBar (заполнение элементами и все такое)
    func tabBarController() {

        let aboutVC = UINavigationController.init(rootViewController: NoutsViewContoller())
        aboutVC.tabBarItem.image = UIImage(systemName: "person")
        aboutVC.tabBarItem.title = "О нас"
        let noutsVS = UINavigationController.init(rootViewController: AboutvViewController())
        noutsVS.tabBarItem.image = UIImage(systemName: "pencil")
        noutsVS.tabBarItem.title = "Записаться"

        let galleryVS = UINavigationController.init(rootViewController: GalleryViewController())
        galleryVS.tabBarItem.image = UIImage(systemName: "camera")
        galleryVS.tabBarItem.title = "Фото"

        viewControllers = [aboutVC, noutsVS, galleryVS]
    }
}
