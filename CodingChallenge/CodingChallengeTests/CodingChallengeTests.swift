//
//  CodingChallengeTests.swift
//  CodingChallengeTests
//
//  Created by margaret on 2019-06-26.
//  Copyright © 2019 margaret. All rights reserved.
//

import XCTest

@testable import CodingChallenge

class CodingChallengeTests: XCTestCase {

    var viewController: ArticlesFeedViewController?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        // instantiate main view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = (storyboard.instantiateViewController(withIdentifier: "ArticlesFeedViewController") as! ArticlesFeedViewController)
        // trick to call loadView
        let _ = viewController?.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController = nil
        super.tearDown()
    }
    
    func testTitle() {
        
        // Return true if view was successfully loaded
        XCTAssertNotNil(viewController?.title)
        
    }

    func testArticleData() {
        
        // make sure that once the view controller is
        // loaded the articles data is empty
        XCTAssertEqual(viewController?.articles.isEmpty, true)
        
    }

    func testFetchJson() {
        let expectation = XCTestExpectation(description: "Download data from reddit")
        viewController?.fetchJSON()
        XCTAssertNotNil(viewController?.articles)
        expectation.fulfill()
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testJSONFeed() {
        let expectation = XCTestExpectation(description: "Download data from reddit")
        XCTAssertEqual(viewController?.articles.count, 0, "no data should be present before we fetch")
        viewController?.fetchJSON()
        XCTAssertEqual(viewController?.articles.count, 27 , "asserting succesful download of data")
        expectation.fulfill()
        wait(for: [expectation], timeout: 10.0)
    }
    
}
