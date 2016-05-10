//
//  HelpPageUIFunctionCheckingUITests2.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 8/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import XCTest

class HelpPageUIFunctionCheckingUITests2: XCTestCase {
        
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
        app.tabBars.childrenMatchingType(.Button).elementBoundByIndex(1).tap()
        app.buttons["Terms&Conditions"].tap()
        app.navigationBars["Terms&Conditions"].buttons["Settings"].tap()
        app.buttons["Feedback"].tap()
        app.textFields["First Name"].tap()
        app.textFields["First Name"].typeText("Jack")
        app.textFields["Last Name"].tap()
        app.textFields["Last Name"].typeText("Chen")
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("s123456789@gmail.com")
        
        
        let element = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element
        element.childrenMatchingType(.TextView).element.tap()
        element.childrenMatchingType(.TextView).element.typeText("Bye")
        app.textFields["Email"].tap()
        app.buttons["Return"].tap()
        app.buttons["Submit"].tap()
        
        let okButton = app.alerts["Thanks for your feedback"].collectionViews.buttons["OK"]
        okButton.tap()
      
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
