//
//  NetworkLayerAsyncTests.swift
//  XCTestMashupTests
//
//  Created by Justin Lee on 7/5/23.
//

import XCTest
@testable import XCTestMashup

final class NetworkLayerAsyncTests: XCTestCase {
    func testScoreGetsIncrementedByOne() async throws {
        let stub = ["unicorn", "dragon"]
        let mockService = MockAnimalService(stub: stub)
        let sut = AnimalListViewModel(animalListProvider: mockService)
        
        await sut.getPetRecommendation()
        
        let upperCasedStub = stub.map { $0.uppercased() }
        XCTAssertEqual(sut.animals, upperCasedStub)
    }
}
