//
//  dependency_injectionTests.swift
//  dependency-injectionTests
//
//  Created by Barış Dilekçi on 17.11.2024.
//

import XCTest
import UIKit
import Swinject
@testable import dependency_injection

final class dependency_injectionTests: XCTestCase {
    
    var viewController: ViewController!
    var mockContainer: Container!

    override func setUp() {
        super.setUp()
        
        mockContainer = Container()
        mockContainer.register(BackgroundColorProviding.self) { resolver in
            return BackgroundColorProviding()
        }
        
        mockContainer.register(SecondViewController.self) { resolver in
            return SecondViewController(providerProtocol: resolver.resolve(BackgroundColorProviding.self))
        }
        
        viewController = ViewController()
        viewController.container = mockContainer
        
        _ = viewController.view
    }


    override func tearDown() {
        viewController = nil
        mockContainer = nil
        super.tearDown()
    }

    func testButtonExistsInView() {
        XCTAssertNotNil(viewController.button)
    }
}
