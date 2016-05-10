

//
//  RMIT_CINEMA_Version2_0UITests.swift
//  RMIT_CINEMA_Version2.0UITests
//
//  Created by JUNHUI HOU on 6/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import XCTest

class RMIT_CINEMA_Version2_0UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.buttons["Forget Details?"].tap()
        app.buttons["Cancel"].tap()
        app.buttons["History"].tap()
        app.navigationBars["History Record"].buttons["Account"].tap()
        app.tabBars.childrenMatchingType(.Button).elementBoundByIndex(1).tap()
        app.buttons["Terms&Conditions"].tap()
        app.navigationBars["Terms&Conditions"].buttons["Settings"].tap()
        app.buttons["Feedback"].tap()
        app.navigationBars["Feedback"].buttons["Settings"].tap()
        app.navigationBars["Settings"].buttons["homebutton"].tap()
        
        
        
               // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
