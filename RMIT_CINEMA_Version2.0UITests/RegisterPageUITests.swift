//
//  RegisterPageUITests.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 8/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import XCTest

class RegisterPageUITests: XCTestCase {
        
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
        app.buttons["No"].tap()
        app.textFields["Firstname"].tap()
        app.textFields["Firstname"].typeText("Jack")
        
        let lastnameTextField = app.textFields["Lastname"]
        lastnameTextField.tap()
        app.textFields["Lastname"].typeText("Chen")
        lastnameTextField.tap()
        app.textFields["Email Address"].tap()
        app.textFields["Email Address"].typeText("s123456789@gmail.com")
        
        let moreNumbersKey = app.keys["more, numbers"]
        moreNumbersKey.tap()
        app.textFields["Email Address"]
        
      
        app.textFields["Password"].tap()
        
        let shiftButton = app.buttons["shift"]
        shiftButton.tap()
        app.textFields["Password"].typeText("Aa123456789")
        moreNumbersKey.tap()
        app.textFields["Password"]
        app.textFields["Confirm Password"].tap()
        shiftButton.tap()
        app.textFields["Confirm Password"].typeText("Aa123456789")
        moreNumbersKey.tap()
        app.textFields["Confirm Password"]
        app.buttons["Register"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
