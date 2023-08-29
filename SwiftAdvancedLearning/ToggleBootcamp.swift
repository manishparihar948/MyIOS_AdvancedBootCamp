//
//  ToggleBootcamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 29.08.23.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(
                isOn: $toggleIsOn,
                label:{
                    Text("Label")
                } )
            .toggleStyle(SwitchToggleStyle())
            
            Spacer()
        }
        .padding(.horizontal,100)
    }
}

struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}
