//
//  CustomNavBarContainerView.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 03.08.23.
//

import SwiftUI

// Make Generic Content
struct CustomNavBarContainerView<Content:View>: View {
    
    let content : Content
    
    @State private var showBackButton: Bool = true
    @State private var title : String = ""
    @State private var subTitle: String? =   nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        VStack(spacing:0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subTitle: subTitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange (CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        
        .onPreferenceChange (CustomNavBarSubtitlePreferenceKey.self, perform: { value in
            self.subTitle = value
        })
        
        .onPreferenceChange (CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                Text("Hello World")
                    .foregroundColor(.white)
                    .customNavigationTitle("New Title")
                    .customNavigationSubtitle("subtitle")
                    .customNavigationBarBackButtonHidden(true)
            }
        }
    }
}
