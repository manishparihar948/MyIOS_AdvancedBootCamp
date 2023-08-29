//
//  AppStorageBootcamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 29.08.23.
//

import SwiftUI

// AppStorage is same as UserDefault of UIKit

struct AppStorageBootcamp: View {
    
   // @State var currentUserName : String?
   // If we want to store data into temprory storage we need to add App storage and remove above line
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing:20) {
            Text(currentUserName ?? "Add Name Here")
            
            if let myCurrentUserName = currentUserName {
                Text(myCurrentUserName)
            }
         
            Button("Save".uppercased()){
                let name = "Emily"
                currentUserName = name
            }
        }
        
    }
}

struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
