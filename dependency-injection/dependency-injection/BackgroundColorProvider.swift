//
//  BackgroundColorProvider.swift
//  dependency-injection
//
//  Created by Barış Dilekçi on 17.11.2024.
//

import Foundation
import UIKit

protocol BackgroundColorProvider {
    var backgroundColor: UIColor { get }
}

class BackgroundColorProviding : BackgroundColorProvider {
    var backgroundColor: UIColor {
        let backgroundColor : [UIColor] = [.systemRed,.systemOrange, .brown]
        return backgroundColor.randomElement()!
    }
}
