//
//  CompareCoreDataWithUserInput.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 22/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import XCTest
@testable import RMIT_CINEMA_Version2_0

class CompareCoreDataWithUserInput: XCTestCase {
    let currentuser: FormModel = FormModel.sharedInstance
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
