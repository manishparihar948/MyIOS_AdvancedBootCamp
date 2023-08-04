//
//  AppNavBarView.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 03.08.23.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(destination: Text("Destination")
                    .customNavigationTitle("Second Title")
                    .customNavigationSubtitle("Second subtitle goes here")
                ) {
                    Text("Navigate")
                }
            }
            .customNavBarItems(title: "New Title", subtitle: "Subtitle", backButtonHidden: true)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    
    private var defaultNavView : some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink(
                    destination:Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                    , label: {
                        Text("Navigate")
                    }
                )
            }
            .navigationTitle("Nav Title Here")
        }
    }
}
