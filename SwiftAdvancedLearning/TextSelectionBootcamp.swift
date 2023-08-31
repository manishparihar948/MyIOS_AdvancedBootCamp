//
//  TextSelectionBootcamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 31.08.23.
//

import SwiftUI

struct TextSelectionBootcamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .textSelection(.enabled)
            //.textSelection(.disabled)
    }
}

struct TextSelectionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextSelectionBootcamp()
    }
}
