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

    var sut: ViewController!
    var vc: ViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(vc?.articles.isEmpty, true, "articles should exist as an empty object")
        XCTAssertEqual(vc?.articles.count, 0, "searchResults should be empty before the data task runs")

    }
    
    func testFetchJSON() {
        XCTAssertEqual(vc?.articles.count, 0, "searchResults should be empty before the data task runs")
        vc.fetchJSON()
        XCTAssertEqual(vc?.articles.count, 27, "searchResults should be empty before the data task runs")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
