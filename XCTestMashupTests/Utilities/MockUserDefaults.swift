//
//  MockUserDefaults.swift
//  XCTestMashupTests
//
//  Created by Justin Lee on 7/5/23.
//

import Foundation
@testable import XCTestMashup

class MockUserDefaults: UserDefaults {
    var score = 0
    
    override func set(_ value: Int, forKey defaultName: String) {
        if defaultName == SettingsManager.score {
            score += 1
        }
    }
}
