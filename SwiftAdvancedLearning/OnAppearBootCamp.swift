//
//  OnAppearBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 27.08.23.
//

import SwiftUI

struct OnAppearBootCamp: View {
    
    @State var text: String = "Starting Text"
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(text)
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    text = "Text got change"
                }
            })
            .onDisappear(perform: {
                text = "Tada text End here"
            })
            .navigationTitle("OnAppear BootCamp")
        }
    }
}

struct OnAppearBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearBootCamp()
    }
}
