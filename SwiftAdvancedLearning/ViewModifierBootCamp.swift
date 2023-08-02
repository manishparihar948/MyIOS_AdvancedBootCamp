//
//  ViewModifier.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 02.08.23.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor : Color
    
    func body(content: Content) -> some View {
            content
            .font(.title)
            .foregroundColor(Color.white)
            .frame(width:300,height: 100)
            .cornerRadius(25.0)
            .background(backgroundColor)
            .padding()
        }
}

extension View {
//    If we dont assign color to the Text then by default it will take red
    func withDefaultButtonFormatting(backgroundColor:Color = .red) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}


struct ViewModifierBootCamp: View {
    var body: some View {
        VStack{
            Text("Hello World")
                .withDefaultButtonFormatting(backgroundColor: .blue)
            
            Text("Hello Xcode")
                .withDefaultButtonFormatting()
            
            Text("Hello IOS")
                .withDefaultButtonFormatting(backgroundColor: .orange)
        }
    }
}

struct ViewModifierBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootCamp()
    }
}
