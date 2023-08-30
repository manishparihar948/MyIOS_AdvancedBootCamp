//
//  StepperBootcamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 30.08.23.
//

import SwiftUI

struct StepperBootcamp: View {
    @State var stepperValue: Int = 10
    @State var widthIncrement : CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + widthIncrement , height: 100)
            
            Stepper("Stepper2"){
                // increment
                incrementWidth(amount: 50)
            } onDecrement: {
                // decrement
                incrementWidth(amount: -50)
            }
            .padding(30)
        }
    }
    
    func incrementWidth(amount : CGFloat){
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
