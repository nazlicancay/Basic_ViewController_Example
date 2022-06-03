//
//  ViewController.swift
//  Odev2
//
//  Created by Nazlıcan Çay on 31.05.2022.
//

import UIKit
//import XCTest

class ViewController: UIViewController , NotificationSettingViewDelegete{
    
    func didTapEnableButton() {
        let alert = UIAlertController(title: "Enable Focus Mode", message: "Focuse Mode is enabled for an hour", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert , animated: true)
    }
    

    private let notificationView = NotificationSettingView()
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationView.delegate = self
        view.addSubview(notificationView)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        notificationView.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom)
    }


}

protocol NotificationSettingViewDelegete : AnyObject {
    func didTapEnableButton()
}

class NotificationSettingView : UIView {
    
    weak var delegate: NotificationSettingViewDelegete?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "moon")
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    private let label: UILabel = {
        
        let label = UILabel()
        label.text = "Push to activate focus mode"
        label.textAlignment = .center
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Eneable Focuse Mode", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(label)
        addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func didTapButton(){
        /// notify controller of tap
        ///
        delegate?.didTapEnableButton()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize = bounds.size.width / 2
        
        imageView.frame = CGRect(x: (bounds.size.width-imageSize)/2, y: 30, width: imageSize, height: imageSize)
        
        label.frame = CGRect(x: -200, y: 30+imageSize+20, width: frame.size.height-20, height: 100)
        
        button.frame = CGRect(x: -200, y: imageSize+180, width: frame.size.height, height: 50)
    }
}

