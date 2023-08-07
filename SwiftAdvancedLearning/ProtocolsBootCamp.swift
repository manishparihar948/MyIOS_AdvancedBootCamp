//
//  ProtocolsBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 07.08.23.
//

import SwiftUI

// Example1
struct DefaultColorTheme : ColorThemeProtocol {
    let primary : Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme : ColorThemeProtocol {
    let primary : Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}

// Why we need Protocols?
// Because colorTheme is not interchangable although we know we have same
// content, they should be interchangeble but swift does not recognize that the
// content is same just the different values.
// Thatswhy we need protocols

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary:Color { get }
}

// Example 2
protocol ButtonTextProtocol {
    var buttonText: String { get }
    func buttonPressed()
}

class DefaultDataSource:ButtonTextProtocol {
    var buttonText: String = "Protocols are awesome!"
    
    func buttonPressed() {
        print("Button was pressed")
    }
}

class AlternativeDataSource:ButtonTextProtocol {
    var buttonText: String = "Protocols are lame"
    
    func buttonPressed() {
        print("Button was pressed")
    }
}


struct ProtocolsBootCamp: View {
    
    // This is the type DefaultColorTheme.
    // let colorTheme : DefaultColorTheme = DefaultColorTheme()
    // let colorTheme : AlternativeColorTheme = AlternativeColorTheme()
    // let colorTheme: ColorThemeProtocol = AlternativeColorTheme()
    
    let colorTheme: ColorThemeProtocol
    let dataSource: DefaultDataSource
    
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            
            // Text("Protocols are awesome")
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

struct ProtocolsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolsBootCamp(colorTheme: DefaultColorTheme(),
                          dataSource: DefaultDataSource())
    }
}
