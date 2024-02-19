//
//  ListPopularItemsPresenterTests.swift
//  NYTimesArticlesTests
//
//  Created by Slacker on 19/02/24.
//

import XCTest
@testable import NYTimesArticles

class ListPopularItemsPresenterTests: XCTestCase {
    
    var sut: ListPopularItemsPresenter!

    var mockInteractor: ListItemsProtocol!
    var mockRouter: ListPopularItemsRouting!
    var mockUI: ListPopularItemsUI!
    
    override func setUpWithError() throws {
        mockInteractor = ListPopularItemsInteractorMock()
        mockRouter = ListPopularItemsRouterMock()
        mockUI = ListPopularItemsUIMock()
        
        self.sut = ListPopularItemsPresenter(listOfItemPopularInteractor: mockInteractor, 
                                             routerDetail: mockRouter)
        self.sut.ui = mockUI
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    func testFetchPopularItems() async throws {
        await sut.fetchPopularItems()
        print("Object ViewModels: \(sut.viewModels)")
        XCTAssertNotNil(sut.viewModels)
        XCTAssertEqual(sut.viewModels.count, 2)
        XCTAssertEqual(sut.viewModels[0].title, "post1")
    }
    
}
