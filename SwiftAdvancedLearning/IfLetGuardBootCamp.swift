//
//  IfLetGuardBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 27.08.23.
//

import SwiftUI

// Safely unwrap the data
// Do not force unwrapping with ! sign
// Instead use if let x = oldX  {} else {}
struct IfLetGuardBootCamp: View {
    
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    @State var currentUserid: String? = "abc234"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we are practicing for safe coding")
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                
                if isLoading {
                    ProgressView()
                }
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear{
                loadData2()
            }
        }
    }
    
    func loadData() {
        if let userID = currentUserid {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                displayText = "This is new text, UserID: \(userID)"
                isLoading = false
            }
        }
        else {
            displayText = "Show Error text"
        }
        
    }
    
    // this is a better approach
    func loadData2() {
        guard let userID = currentUserid else {
            displayText = "Show Error text"
            return
        }
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                displayText = "This is new text, UserID: \(userID)"
                isLoading = false
            
        }
    }
}

struct IfLetGuardBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuardBootCamp()
    }
}
