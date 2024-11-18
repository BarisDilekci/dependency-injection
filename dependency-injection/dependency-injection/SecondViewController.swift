//
//  SecondViewController.swift
//  dependency-injection
//
//  Created by Barış Dilekçi on 17.11.2024.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let provider : BackgroundColorProvider?
    
    init(providerProtocol :  BackgroundColorProvider?) {
        self.provider = providerProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = provider?.backgroundColor ?? .white
    }
}
