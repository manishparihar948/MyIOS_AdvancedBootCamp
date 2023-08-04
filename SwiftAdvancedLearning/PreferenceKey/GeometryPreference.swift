//
//  GeometryPreference.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 03.08.23.
//

import SwiftUI

struct GeometryPreference: View {
    var body: some View {
        VStack{
            Text("Hello World")
                .background(Color.blue)
                .frame(height: 40)
            Spacer()
            HStack {
                Rectangle()
                Rectangle()
                Rectangle()
            }
            .frame(height: 55)
        }
    }
}

struct GeometryPreference_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreference()
    }
}
