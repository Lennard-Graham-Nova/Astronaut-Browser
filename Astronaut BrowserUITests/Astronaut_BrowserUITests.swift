//
//  Astronaut_BrowserUITests.swift
//  Astronaut BrowserUITests
//
//  Created by Lennard Graham on 26/01/2023.
//

import XCTest

final class Astronaut_BrowserUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }

    func testTapAstronautCell() throws {
        XCUIApplication().scrollViews.otherElements.buttons["Name: Thomas Pesquet, Agency name: European Space Agency"].tap()
    }
}
