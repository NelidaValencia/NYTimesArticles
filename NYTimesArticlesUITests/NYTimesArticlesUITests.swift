//
//  NYTimesArticlesUITests.swift
//  NYTimesArticlesUITests
//
//  Created by Slacker on 18/02/24.
//

import XCTest

final class NYTimesArticlesUITests: XCTestCase {

    func testShowListAndGoToDetailArticle() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tableView = app.tables["UITableID"]
        tableView.cells.firstMatch.tap()
        
        app.buttons["Back"].tap()
    }

}
