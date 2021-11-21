//
//  TestHelpers.swift
//  UserDefaultsTests
//
//  Created by waheedCodes on 15/11/2021.
//

import UIKit

/// Button tap helper
///
/// - Parameter button: button under examnation
func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}
