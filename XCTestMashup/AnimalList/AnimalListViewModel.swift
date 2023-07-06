//
//  AnimalListViewModel.swift
//  XCTestMashup
//
//  Created by Justin Lee on 7/5/23.
//

import Foundation

class AnimalListViewModel {
    let animalListProvider: AnimalListProvider
    var animals: [String] = []
    
    init(animalListProvider: AnimalListProvider) {
        self.animalListProvider = animalListProvider
    }
    
    func getPetRecommendation() async {
        animals = await animalListProvider.getPetRecommendation().map { $0.uppercased() }
    }
}
