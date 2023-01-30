//
//  Astronaut_BrowserTests.swift
//  Astronaut BrowserTests
//
//  Created by Lennard Graham on 26/01/2023.
//

import XCTest
@testable import Astronaut_Browser

final class Astronaut_BrowserTests: XCTestCase {

    private var viewModel: AstronautViewViewModel!
    
    override func setUp() async throws {
        try await super.setUp()
        viewModel = AstronautViewViewModel(network: MockNetwork())
        await viewModel.getAstronauts()
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }

    func testAstronautResponseParse() async throws {
        XCTAssertEqual(viewModel.astronauts.count, 10)
    }
    
    func testAstronautResponseParseName() {
        XCTAssertEqual(viewModel.astronauts[0].name, "Thomas Pesquet")
    }
    
    func testAstronautFilterStatusActive() {
        viewModel.filter(status: .active)
        XCTAssertEqual(viewModel.filteredAstronauts.count, 5)
    }
    
    func testAstronautFilterStatusDeceased() {
        viewModel.filter(status: .deceased)
        XCTAssertEqual(viewModel.filteredAstronauts.count, 0)
    }
    
    func testAstronautFilterStatusAll() {
        viewModel.filter(status: .all)
        XCTAssertEqual(viewModel.filteredAstronauts.count, 10)
    }
    
    func testAstronautFilterStatusRetired() {
        viewModel.filter(status: .retired)
        XCTAssertEqual(viewModel.filteredAstronauts.count, 5)
    }
}
