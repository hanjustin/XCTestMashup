//
//  CoreDataServiceTests.swift
//  XCTestMashupTests
//
//  Created by Justin Lee on 7/4/23.
//

import XCTest
@testable import XCTestMashup

final class CoreDataServiceTests: XCTestCase {
    var eventService: EventService!

    override func setUp() {
        super.setUp()
        eventService = EventService(persistentStore: .testing)
    }

    override func tearDown() {
        super.tearDown()
        eventService = nil
    }

    func testAddEvent() throws {
        let (concertName, concertDetail) = ("Music Concert", "Taylor Swift")
        let event = eventService.add(name: concertName, detail: concertDetail)
        XCTAssertNotNil(event.id, "id should not be nil")
        XCTAssertEqual(event.name, concertName, "Created event name should be \(concertName)")
        XCTAssertEqual(event.detail, concertDetail, "Created event detail should be \(concertDetail)")
    }
    
    func testGetEvents() throws {
        let (concertName, concertDetail) = ("Music Concert", "Taylor Swift")
        let event = eventService.add(name: concertName, detail: concertDetail)
        
        let fetchedEvents = eventService.getEvents()
        XCTAssertNotNil(fetchedEvents)
        XCTAssertTrue(fetchedEvents?.count == 1)
        XCTAssertTrue(fetchedEvents?.first?.id == event.id)
        XCTAssertTrue(fetchedEvents?.first?.name == event.name)
        XCTAssertTrue(fetchedEvents?.first?.detail == event.detail)
    }
    
    func testUpdateEvent() throws {
        let (oldName, oldDetail) = ("Old Name", "Old Detail")
        let (newName, newDetail) = ("New Name", "New Detail")
        
        let oldEvent = eventService.add(name: oldName, detail: oldDetail)
        oldEvent.name = newName
        oldEvent.detail = newDetail
        let updatedEvent = eventService.update(oldEvent)
        
        XCTAssertEqual(oldEvent.id, updatedEvent.id)
        XCTAssertTrue(updatedEvent.name == newName)
        XCTAssertTrue(updatedEvent.detail == newDetail)
    }
    
    func testDeleteEvent() throws {
        let event = eventService.add(name: "name", detail: "detail")
        let beforeDeleteFetchResult = eventService.getEvents()
        XCTAssertTrue(beforeDeleteFetchResult?.count == 1)
        
        eventService.delete(event)
        
        let afterDeleteFetchResult = eventService.getEvents()
        XCTAssertTrue(afterDeleteFetchResult?.isEmpty == true)
    }
}
