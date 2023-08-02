//
//  GeometryEffectBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 02.08.23.
//

import SwiftUI

struct GeometryEffectBootCamp: View {
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    var body: some View {
        VStack{
            if !isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    // place matchGeometry before frame always
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100,height: 100)
                    
            }
            
                
            
            Spacer()
            
            if isClicked {
                //RoundedRectangle(cornerRadius: 25.0)
                Circle()
                    .frame(width: 100,height: 100)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)

            }
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct GeometryEffectBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        //GeometryEffectBootCamp()
        MatchedGeometryEffectExample2()
    }
}

struct MatchedGeometryEffectExample2: View {
    let categories : [String] = ["Home", "Popular", "Saved"]
    @State private var selected : String = ""
    @Namespace private var namespace2
    var body: some View {
        HStack{
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namespace2)
                            .frame(width:35, height:2)
                            .offset(y:10)
                    }
                    
                    Text(category)
                        .foregroundColor(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}
