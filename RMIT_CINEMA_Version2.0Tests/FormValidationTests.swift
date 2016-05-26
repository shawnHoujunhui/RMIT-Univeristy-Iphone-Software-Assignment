//
//  FormValidationTests.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 21/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import XCTest
@testable import RMIT_CINEMA_Version2_0

class FormValidationTests: XCTestCase {
    let validation:ViewController = ViewController()
     let currentuser: FormModel = FormModel.sharedInstance
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    // 1. First name validation checking
    func testFirstNameValidation() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // 1. Test First name validation - without any numbers otherwise appear error
        let firstnametestField = UITextField()
        firstnametestField.text = "123ABC"
        XCTAssertFalse(firstnametestField.validateFirstName())
    }
    // extra validation checking function.
    // 2. Last name validation checking
    
    func testLastNameValidation() {
        
        //  Test last name validaiton - without any numbers otherwise should appear error
        let lastnametestField = UITextField()
        lastnametestField.text = "Jack12345"
        XCTAssertFalse(lastnametestField.validateLastName())
    }
    // 3. email address validation checking
    func testEmailAddressValidation(){
        
        // Test email address validation
        let emailAddressField = UITextField()
        emailAddressField.text = "s34256812@gmail.com"
        XCTAssertTrue(emailAddressField.validateEmail())
    }
    // 4. password format validation checking
    func testPasswordValidation(){
        
        // Test password format validation
        let passwordField = UITextField()
        passwordField.text = "Aa55660079"
        XCTAssertTrue(passwordField.validatePassword())
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
