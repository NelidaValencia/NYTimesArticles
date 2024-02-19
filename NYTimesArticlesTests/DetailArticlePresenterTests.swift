//
//  DetailArticlePresenterTests.swift
//  NYTimesArticlesTests
//
//  Created by Slacker on 19/02/24.
//

import XCTest
@testable import NYTimesArticles

class DetailArticlePresenterTests: XCTestCase {

    var sut: DetailArticlePresenter!
    
    var mockInteractor: DetailArticleProtocol!
    var mockUI: DetailArticlePresenterUI!
    
    override func setUpWithError() throws {
        mockInteractor = DetailArticleInteractorMock()
        mockUI = DetailArticlePresenterUIMock()
        
        self.sut = DetailArticlePresenter(
            articles:mockPopularItemEntity,
            interactor: mockInteractor)
        self.sut.ui = mockUI
    }

    override func tearDownWithError() throws {
        self.sut = nil
    }

    func testonViewAppear() async throws {
        await sut.onViewAppear()
        print("Object ViewModel: \(String(describing: sut.viewModel))")
        XCTAssertNotNil(sut.viewModel)
        XCTAssertEqual(sut.viewModel.title, "post1")
    }
}
