//
//  AnimalService.swift
//  XCTestMashup
//
//  Created by Justin Lee on 7/5/23.
//

import Foundation

protocol AnimalListProvider {
    func getPetRecommendation() async -> [String]
}

class AnimalService: AnimalListProvider {
    func getPetRecommendation() async -> [String] {
        // Calls webservice
        // Parse JSON data
        // Some additional logic
        return ["dog", "cat"]
    }
}
