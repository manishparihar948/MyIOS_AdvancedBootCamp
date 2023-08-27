//
//  DarkModeBootcamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 27.08.23.
//

import SwiftUI

// Two ways of changing color in Light and Dark Mode in ios
// 1. Adaptive Color add in Assest.xcassets
// 2. Add create environment and add color modifiers

struct DarkModeBootcamp: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This color is Primary")
                        .foregroundColor(.primary)
                    
                    Text("This color is Secondary")
                        .foregroundColor(.secondary)
                    
                    Text("This color is Black")
                        .foregroundColor(.black)
                    
                    Text("This color is White")
                        .foregroundColor(.white)
                    
                    Text("This color is Red")
                        .foregroundColor(.red)
                    
                    Text("This color is global adaptive")
                        .foregroundColor(Color("AdaptiveColor"))
                    
                    Text("This color is locally adaptive")
                        .foregroundColor(colorScheme == .light ? .green : .yellow)
                }
            }
            .navigationTitle("Dark Mode BootCamp")
        }
    }
}

struct DarkModeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkModeBootcamp()
                .preferredColorScheme(.light)
            DarkModeBootcamp()
                .preferredColorScheme(.dark)
        }
    }
}
