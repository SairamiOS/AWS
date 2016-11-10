//
//  AWSUITests.swift
//  AWSUITests
//
//  Created by GEIDC on 10/24/16.
//  Copyright © 2016 GEIDC. All rights reserved.
//

import XCTest

class AWSUITests: XCTestCase {
        
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
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    //Mark : test case on login in sairamios branch
    func testLogin() {
        
        let app = XCUIApplication()
        let mailTextField = app.textFields["mail"]
        mailTextField.tap()
        mailTextField.typeText("asira@g.com")
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12ed")
        app.buttons["SIGN IN"].tap()
        
        
    }
    
    func test_mail_valid() {
        
        let mailTextField = XCUIApplication().textFields["mail"]
        mailTextField.tap()
        mailTextField.typeText("dd")
        
        let app = XCUIApplication()
        app.secureTextFields["password"].typeText("ddd")
        app.buttons["SIGN IN"].tap()
        app.alerts["Alert"].buttons["Ok"].tap()
        
        
    }
    
}
