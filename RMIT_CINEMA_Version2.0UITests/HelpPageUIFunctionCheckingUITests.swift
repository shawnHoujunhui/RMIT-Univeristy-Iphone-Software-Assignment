//
//  HelpPageUIFunctionCheckingUITests.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 8/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import XCTest

class HelpPageUIFunctionCheckingUITests: XCTestCase {
        
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
        app.buttons["History"].tap()
        app.navigationBars["History Record"].buttons["Account"].tap()
        app.buttons["Forget Details?"].tap()
        app.textFields["First Name"].tap()
        app.textFields["First Name"].typeText("Jack")
        app.textFields["Email Address"].tap()
        app.textFields["Email Address"].typeText("s123456789@gmail.com")
        
        let moreNumbersKey = app.keys["more, numbers"]
        moreNumbersKey.tap()
        app.textFields["Email Address"]
        
        let moreLettersKey = app.keys["more, letters"]
        moreLettersKey.tap()
        app.textFields["Email Address"]
        moreNumbersKey.tap()
        app.textFields["Email Address"]
        moreLettersKey.tap()
        app.textFields["Email Address"]
        app.buttons["Return"].tap()
        app.buttons["Submit"].tap()
        
        let okButton = app.alerts["Please Check your registered email "].collectionViews.buttons["OK"]
        okButton.tap()
        app.buttons["Cancel"].tap()
        app.navigationBars["Account"].buttons["homebutton"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
