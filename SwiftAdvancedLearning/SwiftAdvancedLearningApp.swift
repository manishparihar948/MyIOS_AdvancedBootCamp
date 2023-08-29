//
//  SwiftAdvancedLearningApp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 02.08.23.
//

import SwiftUI

@main
struct SwiftAdvancedLearningApp: App {
    
    let currentUserIsSignedIn: Bool
    
//    this is our first initializer, going  to execute the app firsts
// Use this only for debug scheme not for Production
    init() {
        
        /* Method 1 */
        // We want dependency injection to inject this usesrIsSignedIn in to the rest of our app, this is where dependency injection is required, because we need to inject the value into our app
       
        // This is for Argument passed on launch -> Product -> Schema -> Edit Schema -> Argument Passed on Launch
        let userIsSignedIn: Bool =  CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false
        
        // Use above line or below line both is same thing
        //let userIsSignedIn: Bool = ProcessInfo.processInfo.arguments.contains("-UITest_startSignedIn") ? true : false
        self.currentUserIsSignedIn = userIsSignedIn
        // print("USER IS SIGNED IN: \(userIsSignedIn)")
        
        
        
/* Method 2 */
// This is for Environment Variable Set -> Product -> Schema -> Edit Schema -> Environment Variable
      //  let value = ProcessInfo.processInfo.environment["-UITest_startSignedIn2"]
      //  let myuserIsSignedIn: Bool = value == "true"  ? true : false
      //  self.currentUserIsSignedIn = myuserIsSignedIn
    
        
       
    }
    
    var body: some Scene {
        
        WindowGroup {
            //GeometryEffectBootCamp()
            // MatchedGeometryEffectExample2()
            //UITestingBootCampView(currentUserIsSignedIn: currentUserIsSignedIn)
            AppStorageBootcamp()
        }
    }
}
