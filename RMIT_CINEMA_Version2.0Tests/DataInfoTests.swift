//
//  DataInfoTests.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 21/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import XCTest
@testable import RMIT_CINEMA_Version2_0
class DataInfoTests: XCTestCase {
    
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
    
    // Data Store Checking History recording
    func testHistoryHistory(){
        //
        self.historypage.saveHistory("1", movieName: "Happy Day", price: "18", time: "180")
        //let history = self.historypage
        XCTAssertEqual(1, self.historypage.histories.count)
    }
    // Data Store Checking User info recording
    func testUserFormDataStored(){
        
        self.currentuser.saveForm("s123@student.com", password: "Aa1234567", firstname: "Junhui", lastname: "Hou")
        XCTAssertNotEqual(2, self.currentuser.forms.count)
    }
    // Data Store Checking Movie info recording
    func testMovieDataStored(){
        
        self.currentmovie.saveMovie("1", title: "China Town", overview: "Good luck day", releaseDate: "2016-05-06", poster: "null", adult: "false", language: "English", genres: "Null", companies: "Air China", countries: "Australia", runtime: "128", status: "release")
        XCTAssertEqual(1, self.currentmovie.movies.count)
    }
    
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
