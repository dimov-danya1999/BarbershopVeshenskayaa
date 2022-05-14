

import UIKit
import SnapKit

class AboutvViewController: UIViewController { // о нас

    fileprivate lazy var sourceView = AboutvView() // источник view данных для нашего controllera

//MARK: - loadView()
    override func loadView() {
        super.loadView()
        self.view = sourceView
    }

//MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

