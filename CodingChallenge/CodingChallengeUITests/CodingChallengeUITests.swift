//
//  CodingChallengeUITests.swift
//  CodingChallengeUITests
//
//  Created by margaret on 2019-06-28.
//  Copyright © 2019 margaret. All rights reserved.
//

import XCTest

class CodingChallengeUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDetailScreenItems() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["What’s everyone working on this month? (June 2019)"]/*[[".cells.staticTexts[\"What’s everyone working on this month? (June 2019)\"]",".staticTexts[\"What’s everyone working on this month? (June 2019)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let titleStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Title"]/*[[".staticTexts[\"What’s everyone working on this month? (June 2019)\"]",".staticTexts[\"Title\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertNotNil(titleStaticText)
        //titleStaticText.tap()
        //titleStaticText.swipeRight()
        
        let contentTextView = app.textViews["Content"]
        XCTAssertNotNil(contentTextView)
        //contentTextView.tap()
         app.navigationBars["r/swift"].buttons["r/swift"].tap()
        
    }
    
    func testMainViewTitle() {
        
        let app = XCUIApplication()
        
        let titleStaticText = app.textViews["tableView title"]
        XCTAssertNotNil(titleStaticText)
        
    }
    
}
