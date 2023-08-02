//
//  ButtonStyleBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 02.08.23.
//

import SwiftUI

struct PressableStyle: ButtonStyle {
    
    let scaledAmount : CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            //.brightness(configuration.isPressed ? 0.05 : 0)
            //.opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount:CGFloat = 0.9) -> some View {
        self.buttonStyle(PressableStyle(scaledAmount: scaledAmount))
    }
}


struct ButtonStyleBootCamp: View {
    var body: some View {
        VStack{
            Button(action: {
                
            },
            label: {
                Text("Click Me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(color: Color.blue.opacity(0.3), radius:10,x:0.0,y: 10)
            })
            //.buttonStyle(PressableStyle())
            .withPressableStyle(scaledAmount: 0.5)
            .padding(40)
        }
    }
}

struct ButtonStyleBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootCamp()
    }
}
