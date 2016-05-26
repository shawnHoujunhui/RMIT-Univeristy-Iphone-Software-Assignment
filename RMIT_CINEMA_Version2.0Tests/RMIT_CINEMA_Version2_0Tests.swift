//
//  RMIT_CINEMA_Version2_0Tests.swift
//  RMIT_CINEMA_Version2.0Tests
//
//  Created by JUNHUI HOU on 6/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import XCTest
@testable import RMIT_CINEMA_Version2_0

class RMIT_CINEMA_Version2_0Tests: XCTestCase {
    
    let validation:ViewController = ViewController()
    let historypage: HistoryModel = HistoryModel.sharedInstance
    let currentuser: FormModel = FormModel.sharedInstance
    let currentmovie: MovieModel = MovieModel.sharedInstance
    

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // 1. Validation checking
    func testFirstNameValidation() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // 1. Test First name validation - without any numbers otherwise appear error
        let firstnametestField = UITextField()
        firstnametestField.text = "123ABC"
        XCTAssertFalse(firstnametestField.validateFirstName())
    }
    
    // 2. Data Store Checking History recording
    func testHistoryHistory(){
        // History data store
        self.historypage.saveHistory("1", movieName: "Happy Day", price: "18", time: "180")
        //let history = self.historypage
        XCTAssertEqual(1, self.historypage.histories.count)
    }
    
    
    func testUserFormDataStored(){
        // User data store
        self.currentuser.saveForm("s123@student.com", password: "Aa1234567", firstname: "Junhui", lastname: "Hou")
        XCTAssertNotEqual(2, self.currentuser.forms.count)
    }
    
    func testMovieDataStored(){
        // Movie data store
        self.currentmovie.saveMovie("1", title: "China Town", overview: "Good luck day", releaseDate: "2016-05-06", poster: "null", adult: "false", language: "English", genres: "Null", companies: "Air China", countries: "Australia", runtime: "128", status: "release")
        XCTAssertEqual(1, self.currentmovie.movies.count)
    }

    
    // 3. Compare coredata Info with user input Info
    
    func testValidateEmailVal(){
        
        self.currentuser.saveForm("s123@student.com", password: "Aa1234567", firstname: "Junhui", lastname: "Hou")
        if currentuser.forms.count > 0{
            for currenInfo in currentuser.forms{
                let emailAddress = UITextField()
                emailAddress.text = "s12345@student.com"
                XCTAssertFalse(currenInfo.emailaddress == emailAddress.text)
                
            }
        }
    }
    
    func testValidatePasswordVal(){
        self.currentuser.saveForm("s123@student.com", password: "Aa1234567", firstname: "Junhui", lastname: "Hou")
        if currentuser.forms.count > 0{
            for currentInfo in currentuser.forms{
                let emailAddress = UITextField()
                emailAddress.text = "s123@student.com"
                let firstname = UITextField()
                firstname.text = "Junhui"
                let lastname = UITextField()
                lastname.text = "Hou"
                let password = UITextField()
                password.text = "Aa1234567890"
                XCTAssertFalse(currentInfo.password == password.text)
            }
        }
    }
    
    
    
    // 4. place distance accurate checking
//    func textBearingBetweenTwoPoints(){
//        let map: MapViewController = MapViewController()
//        XCTAssertNil(map.reset())
//    }
//    
    
    
    

    
    // extra validation checking function.
    // 1. Last name validation checking
    func testLastNameValidation() {
    
        //  Test last name validaiton - without any numbers otherwise should appear error
        let lastnametestField = UITextField()
        lastnametestField.text = "Jack12345"
        XCTAssertFalse(lastnametestField.validateLastName())
    }
    // 2. email address validation checking
    func testEmailAddressValidation(){
        
        // Test email address validation
        let emailAddressField = UITextField()
        emailAddressField.text = "s34256812@gmail.com"
        XCTAssertTrue(emailAddressField.validateEmail())
    }
    // 3. password format validation checking
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
