//
//  SettingsManager.swift
//  XCTestMashup
//
//  Created by Justin Lee on 7/5/23.
//

import Foundation

class SettingsManager {
    static let score = "Score"
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func incremetScore() {
        let newScore = userDefaults.integer(forKey: SettingsManager.score) + 1
        userDefaults.set(newScore, forKey: SettingsManager.score)
    }
}
