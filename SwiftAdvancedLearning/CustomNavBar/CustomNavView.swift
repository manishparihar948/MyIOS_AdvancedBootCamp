//
//  CustomNavView.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 03.08.23.
//

import SwiftUI

struct CustomNavView<Content:View>: View {
    let content: Content
    
    init(@ViewBuilder content:() -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView{
            CustomNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView{
            Color.red.ignoresSafeArea()
        }
    }
}

// Drag back from the view to parent view
extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
