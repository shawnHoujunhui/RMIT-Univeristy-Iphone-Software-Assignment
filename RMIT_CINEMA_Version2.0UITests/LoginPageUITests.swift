//
//  LoginPageUITests.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 8/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import XCTest

class LoginPageUITests: XCTestCase {
        
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
        app.buttons["Yes"].tap()
        app.textFields["Username"].tap()
        app.textFields["Username"]
        
        let moreNumbersKey = app.keys["more, numbers"]
        moreNumbersKey.tap()
        app.textFields["Username"]
        
        let moreLettersKey = app.keys["more, letters"]
        moreLettersKey.tap()
        app.textFields["Username"].typeText("s123456@gmail.com")
   
        app.textFields["Password"].tap()
        app.buttons["shift"].tap()
        app.textFields["Password"].typeText("Abc123456")
        
        let loginButton = app.buttons["Login"]
        loginButton.tap()

        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
