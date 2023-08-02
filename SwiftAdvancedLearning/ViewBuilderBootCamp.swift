//
//  ViewBuilderBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 02.08.23.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

// Create Generic
struct HeaderViewGeneric<Content:View>: View {
    
    let title: String
    let content: Content // Because content can be anything like icon, string or boolean value
    
    init(title: String, @ViewBuilder  content:() ->  Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct ViewBuilderBootCamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "New Title", description: "Hello", iconName: "heart.fill")
            
            HeaderViewRegular(title: "Another Title", description: "World", iconName: nil)
        
           
            HeaderViewGeneric(title: "Generic Title") {
                
                HStack {
                    Text("Hey")
                    Image(systemName: "heart.fill")
                }
            }
           
            // These custom viewbuilder exactly work as HStack here
            CustomHStack {
                Text("Hi")
                Text("Hi")
            }
                               
                              

            Spacer()
        }
    }
}

struct ViewBuilderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderBootCamp()
    }
}


struct CustomHStack<Content : View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}
