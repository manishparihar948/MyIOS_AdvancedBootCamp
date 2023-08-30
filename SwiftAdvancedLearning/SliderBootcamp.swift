//
//  SliderBootcamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 30.08.23.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State var sliderValue : Double = 10
    @State var color: Color = .red
    var body: some View {
        VStack {
            Text("Rating:")
            //Text("\(sliderValue)")
            
            Text(
                String(format: "%.0f", sliderValue)
            )
            .foregroundColor(color)
            //Slider(value: $sliderValue)
            //Slider(value: $sliderValue, in: 0...5)
            /*
             Slider(value: $sliderValue,
                    in:1...5,
                    step:0.5
             )
             */
            Slider(value: $sliderValue,
                   in: 1...5,
                   onEditingChanged: { (_) in
                color = .green
            },
                   minimumValueLabel: Text("1"),
                   maximumValueLabel: Text("5"),
                   label: {Text("Title")}
            )
                .accentColor(.red)
            
        }
    }
}

struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}
