//
//  DocumentationBootcamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 27.08.23.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    // MARK: PROPERTIES
    @State var data : [String] = ["Apple", "Oranges", "Bananas"]
    @State var showAlert: Bool = false
    
    // MARK: BODY
    
    // Manish - Working copy - Things to do
    /*
     1. Fix Title
     2. Fix alert
     
     Code Folding - Option + Command + Left Arrow
     */
    
    
    var body: some View {
        NavigationView { // START: NAV
            
            // foreground
            foregroundLayer
            .navigationTitle("Documentation")
            .navigationBarItems(trailing: Button("Alert", action: {
                showAlert.toggle()
            }))
            .alert(isPresented: $showAlert, content: {
                getAlert(text:"This is the alert!")
            })
        } // END: NAV
    }
    
    /// This is the foreground layer that holds a scrollView
    private var foregroundLayer: some View {
        ScrollView {
            Text("Hello")
            ForEach(data, id: \.self){ name in
                Text(name)
                    .font(.headline)
                
            }
        }
    }
    
    // MARK: FUNCTIONS
    /// Gets an alert with a specified title
    ///
    /// This function creates and returns an alert immediately. This alert will have a title based on the text parameter but it will NOT have a message
    /// 
    ///
    /// - Parameter text: This is the title for the Alert
    /// - Returns: Returns an alert with a title
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

// MARK: PREVIEWS
struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
