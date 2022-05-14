

import UIKit
import SnapKit
import SwiftUI

class AboutvView: UIView {


    //MARK: - Элементы Картинки
    lazy var myImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "view")
        return imageView
    }()

    lazy var logoImage: UIImageView = {
        var imageLogo = UIImageView()
        imageLogo.contentMode = .scaleAspectFit
        imageLogo.image = UIImage(named: "png")
        return imageLogo
    }()


    //MARK: - Элементы Кнопки
    lazy var buttonRegister: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Записаться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(phone(_:)), for: .touchDown)
        return button
    }()

    @objc func whatsApp(_ sender: UIButton) {
        let phoneNumber = "+79612727705"
        let url = URL(string: "https://api.whatsapp.com/send?phone=\(phoneNumber)")!
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 13.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            else {
                UIApplication.shared.openURL(url)
            }
        }
        //        UIApplication.shared.open(URL(string: "https://www.google.ru/")! as URL, options: [:], completionHandler: nil)
    }

    @objc func phone(_ sender: UIButton) {
        let phoneNubmer = "+79612727705"
        if let url = URL(string: "tel://\(phoneNubmer)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(url)
            }
        }
        //UIApplication.shared.open(URL(string: "")! as URL, options: [:], completionHandler: nil)
    }

    lazy var buttonWhatsApp: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Написать нам ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(whatsApp(_:)), for: .touchDown)
        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        screenConstraint()
        print(NoutsViewContoller.screnSize.height)
    }

    //MARK: - Констрейнты
    private func screenConstraint(){

        //            make.width.equalTo(NoutsViewContoller.screnSize.width)

        self.addSubview(myImage)
        myImage.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }


        self.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.height.equalTo(NoutsViewContoller.screnSize.height / 2.3)
            make.width.equalTo(NoutsViewContoller.screnSize.width / 1.3)
            make.center.equalToSuperview()
        }


        // анимация воркает криво 
        UIView.animate(withDuration: 1.0) { [self] in
            // кнопка "Записаться"
            self.addSubview(buttonRegister)
            buttonRegister.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalTo((NoutsViewContoller.screnSize.width / 1.24))
                make.height.equalTo(NoutsViewContoller.screnSize.height / 12)
                make.bottom.equalTo(safeAreaLayoutGuide).inset(NoutsViewContoller.screnSize.width / 4.5) // пока пусть будет так
            }
          self.layoutIfNeeded()


        }

        // кнопка "Написать"
        self.addSubview(buttonWhatsApp)
        buttonWhatsApp.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(NoutsViewContoller.screnSize.width / 1.24)
            make.height.equalTo(NoutsViewContoller.screnSize.height / 12)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(10)
        }


    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
