//
//  UserDefaultsSettingsTests.swift
//  XCTestMashupTests
//
//  Created by Justin Lee on 7/5/23.
//

import XCTest
@testable import XCTestMashup

class MockUserDefaults: UserDefaults {
    var score = 0
    
    override func set(_ value: Int, forKey defaultName: String) {
        if defaultName == SettingsManager.score {
            score += 1
        }
    }
}

final class UserDefaultsSettingsTests: XCTestCase {
    func testScoreGetsIncrementedByOne() throws {
        let mockDefaults = MockUserDefaults()
        let settingsManager = SettingsManager(userDefaults: mockDefaults)
        
        XCTAssertEqual(mockDefaults.score, 0, "Initial score should be 0")
        for i in 1...10 {
            settingsManager.incremetScore()
            XCTAssertTrue(mockDefaults.score == i, "Score should be \(i) after \(i) iteration.")
        }
    }
}
