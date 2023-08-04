//
//  PreferenceKeyBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 03.08.23.
//

// When we use PreferenceKey , when we needed it
// When child class has value but parent class does not.


import SwiftUI

struct PreferenceKeyBootCamp: View {
    @State private var text : String = "Hello World!!"
    var body: some View {
        NavigationView{
            VStack {
              SecondScreen(text: text)
                    .navigationTitle("Navigation Title")
                    // This value is coming from child level
                    //.preference(key:CustomTitlePreferenceKey.self, value: "New Value")
                   
                    //.customTitle("New Value")
            }
            
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: {value in
            self.text = value
        })
    }
}

// Create extension for Preference Key
extension View {
    // use underscore to make it global name
    func customTitle(_ text:String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct PreferenceKeyBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyBootCamp()
    }
}

struct SecondScreen: View {
    
    let text: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
            .onAppear(perform: getDataFromDatabase)
            .customTitle(newValue)
        
        
    }
    
    func getDataFromDatabase() {
        // download
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.newValue = "New Value From Database"
        }
    }
}

// Custom Preference Key
// CustomTitlePreferenceKey will be global value
struct CustomTitlePreferenceKey: PreferenceKey {
    
    // Default blank screen
    static var defaultValue: String = ""
    
    static func reduce(value: inout Value, nextValue: () -> String) {
        value = nextValue()
    }
}
