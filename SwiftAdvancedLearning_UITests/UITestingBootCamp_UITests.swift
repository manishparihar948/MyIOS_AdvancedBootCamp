//
//  UITestingBootCamp_UITests.swift
//  SwiftAdvancedLearning_UITests
//
//  Created by Manish Parihar on 10.08.23.
//

import XCTest

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct]_[ui component]_[expected result]
// Testing Structure: Given, When, Then

// First Click on func func test_UITestingBootCampView_signUpButton_shouldSignIn() and start recording with bottom red button to capture then click on simulator ui and after record stop the record button

final class UITestingBootCamp_UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
// MARK: - Textfield
    func test_UITestingBootCampView_signUpButton_shouldNotSignIn() {
        
        /*
         // Given
         let textfield = app.textFields["SignUpTextField"]
         
         // When
         textfield.tap()
         
         let signUpButton = app.buttons["SignUpButton"]
         signUpButton.tap()
         */
        
        signUpAndSignIn(shouldTypeOnKeyboard: false)
         
         let navBar = app.navigationBars["Welcome"]
         
         // Then
         XCTAssertFalse(navBar.exists) // // Wait for the navigation bar to appear
    }
    
    func test_UITestingBootCampView_signUpButton_shouldSignIn() {
       
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        textfield.typeText("H")
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        //XCTAssert(navBar.waitForExistence(timeout: 5)) // // Wait for the navigation bar to appear
        XCTAssertTrue(navBar.exists)
        
        
//        let app = XCUIApplication()
//        app.textFields["Add your name..."].tap()
//        app.buttons["Sign Up"].tap()
//        app.navigationBars["Welcome"].staticTexts["Welcome"].tap()
            
    }

// MARK: - SignIn Home Alert Button
    func test_SignInHomeView_showAlertButton_shouldDisplayAlert() {
        
         // Given
         let textfield = app.textFields["SignUpTextField"]
         
         // When
         textfield.tap()
         textfield.typeText("H")
         
         let signUpButton = app.buttons["SignUpButton"]
         signUpButton.tap()
         
         let navBar = app.navigationBars["Welcome"]
        
         XCTAssertTrue(navBar.exists)
        
        let alertButton = app.buttons["ShowAlertButton"]
        alertButton.tap()
        
        let alert = app.alerts.firstMatch //app.alerts["Welcome to the app"] instead of these we can use firstMatch
        
        // Then
        XCTAssertTrue(alert.exists)
    }

    func test_SignInHomeView_showAlertButton_shouldDisplayAndDismissAlert() {
      
        
         // Given
         let textfield = app.textFields["SignUpTextField"]
         
         // When
         textfield.tap()
         textfield.typeText("H")
         
         let signUpButton = app.buttons["SignUpButton"]
         signUpButton.tap()
         
         let navBar = app.navigationBars["Welcome"]
        
         XCTAssertTrue(navBar.exists)
        
        let alertButton = app.buttons["ShowAlertButton"]
        alertButton.tap()
        
        let alert = app.alerts.firstMatch //app.alerts["Welcome to the app"] instead of these we can use firstMatch
        XCTAssertTrue(alert.exists)
        
        let alertOKButton = alert.buttons["OK"]
        alertOKButton.tap()
        
        // Then
        XCTAssertFalse(alert.exists)

        
//        let app = XCUIApplication()
//        app/*@START_MENU_TOKEN@*/.textFields["SignUpTextField"]/*[[".textFields[\"Add your name...\"]",".textFields[\"SignUpTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.buttons["SignUpButton"]/*[[".buttons[\"Sign Up\"]",".buttons[\"SignUpButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.buttons["Show welcome alert"].tap()
//        app.alerts["Welcome to the app"].scrollViews.otherElements.buttons["OK"]/*@START_MENU_TOKEN@*/.press(forDuration: 0.8);/*[[".tap()",".press(forDuration: 0.8);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
    }
    
// MARK: - Navigation
    func test_SignInHomeView_navigationLinkToDestination_shouldNavigateToDestination(){
        
         // Given
        let textfield = app.textFields["SignUpTextField"]
         
         // When
         textfield.tap()
         textfield.typeText("H")
         
         let signUpButton = app.buttons["SignUpButton"]
         signUpButton.tap()
         
         let navBar = app.navigationBars["Welcome"]
         XCTAssertTrue(navBar.exists)
        
        let navLinkButton = app.buttons["NavigationLinkToDestination"]
        navLinkButton.tap()
        
        let destinationText = app.staticTexts["Destination"]
        
        // Then
        XCTAssertTrue(destinationText.exists)
    }
    
    func test_SignInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAngGoBack(){
       
        
         // Given
        let textfield = app.textFields["SignUpTextField"]
         
         // When
         textfield.tap()
         textfield.typeText("H")
         
         let signUpButton = app.buttons["SignUpButton"]
         signUpButton.tap()
         
         let navBar = app.navigationBars["Welcome"]
         XCTAssertTrue(navBar.exists)
        
        let navLinkButton = app.buttons["NavigationLinkToDestination"]
        navLinkButton.tap()
        
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)

        let backButton = app.navigationBars.buttons["Welcome"]
        backButton.tap()
        
        // Then
        XCTAssertTrue(navBar.exists)

        
//        let app = XCUIApplication()
//        app/*@START_MENU_TOKEN@*/.textFields["SignUpTextField"]/*[[".textFields[\"Add your name...\"]",".textFields[\"SignUpTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.buttons["SignUpButton"]/*[[".buttons[\"Sign Up\"]",".buttons[\"SignUpButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Welcome"].staticTexts["Welcome"].tap()
//        app/*@START_MENU_TOKEN@*/.buttons["NavigationLinkToDestination"]/*[[".buttons[\"Navigate\"]",".buttons[\"NavigationLinkToDestination\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.staticTexts["Destination"].tap()
                    
                
    }
}


// We can create an extension of the class to avoid repeating the code in every test function.
extension UITestingBootCamp_UITests {
    
    func signUpAndSignIn(shouldTypeOnKeyboard:Bool) {
       
        // Given
       let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        if shouldTypeOnKeyboard {
            textfield.typeText("H")
        }
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
    }
}
