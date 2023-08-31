//
//  ButtonStyleAndControlSize.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 31.08.23.
//

import SwiftUI

struct ButtonStyleAndControlSize: View {
    var body: some View {
        VStack {
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            .controlSize(.small) // ios 15

            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            .controlSize(.mini) // ios 15

            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
            .controlSize(.regular) // ios 15

            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.large) // ios 15

        }
    }
}

struct ButtonStyleAndControlSize_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleAndControlSize()
    }
}
