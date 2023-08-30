//
//  PickerBootcamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 29.08.23.
//

import SwiftUI

struct PickerBootcamp: View {
    
   // @State var selection : String = "1"
    @State var selection : String = "Most Recent"
    let filterOptions: [String] =  [
        "Most Recent", "Most Popular", "Most Liked"
    ]
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Age")
                Text(selection)
            }
            
            Picker(
                selection: $selection,
                label: Text("Picker"),
                content: {
                    ForEach((18..<100)) { number in
                        Text("\(number)")
                            .tag("\(number)")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                }
            )
            //.background(Color.gray.opacity(0.1))
            .pickerStyle(WheelPickerStyle())
        }
    }
     
    
    /*
    var body: some View {
       
        Picker(
            selection: .constant(1),
            label: {
                HStack {
                    Text("Filter:")
                    Text(selection)
                }
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.green)
                .padding()
                .padding(.horizontal)
                .cornerRadius(10)
                .shadow(color: Color.green.opacity(0.3), radius: 10, x: 0, y: 10)
            },
            content: {
                ForEach(filterOptions, id:\.self) { option in
                    Text(option)
                        .tag(option)
                }
            })
            .pickerStyle(MenuPickerStyle())
    }
     */
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
