//
//  ViewController.swift
//  dependency-injection
//
//  Created by Barış Dilekçi on 17.11.2024.
//

import UIKit
import Swinject


final class ViewController: UIViewController {

    
    lazy var  button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.setTitle("Open Another VC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(nil, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
     lazy var container : Container = {
        let container = Container()
        container.register(BackgroundColorProviding.self) { resolver in
            return BackgroundColorProviding()
        }
        
        container.register(SecondViewController.self) { resolver in
            let viewController = SecondViewController(providerProtocol: resolver.resolve(BackgroundColorProviding.self))
            return viewController
        }
        
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        
        button.center = view.center
        view.addSubview(button)
        
    }
    
    @objc  func buttonClicked() {
        if let viewController = container.resolve(SecondViewController.self) {
            present(viewController, animated: true, completion: nil)
        }
    }
}

