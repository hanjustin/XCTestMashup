//
//  MockAnimalService.swift
//  XCTestMashupTests
//
//  Created by Justin Lee on 7/5/23.
//

import Foundation
@testable import XCTestMashup

class MockAnimalService: AnimalListProvider {
    let stubData: [String]
    
    init(stub: [String]) {
        self.stubData = stub
    }
    
    func getPetRecommendation() async -> [String] {
        return stubData
    }
}
