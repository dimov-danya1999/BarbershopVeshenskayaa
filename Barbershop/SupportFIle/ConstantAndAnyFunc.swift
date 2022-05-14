
import Foundation
import UIKit

open class ConstantAndAnyFunc {

    //MARK: - Что бы цвет при скроли у tableView и navigationContooler не менялся цвет
    static func setColorSettings(navigationController navC: UINavigationController, tabBarController tabC: TabBarController, colorOne: UIColor, colorTwo: UIColor){

        // Navigation Bar:
        navC.navigationBar.barTintColor = colorOne

        // ext:
        navC.navigationBar.titleTextAttributes = [.foregroundColor: colorOne]

        // Tab Bar:
        tabC.tabBar.barTintColor = colorTwo

        // Tab Bar Text: - Желтый цвет на всех tabBar где есть какой то label
        tabC.tabBar.tintColor = UIColor.yellow
    }
}

