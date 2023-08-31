//
//  TabBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 30.08.23.
//

import SwiftUI

struct TabBootCamp: View {
    
    @State var selectedTab: Int = 0
    
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill"
    ]
    
    var body: some View {
        
        /*
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            
            Text("BROWSE TAB")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            
            Text("PROFILE TAB")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(.red)
         */
        
        
        TabView {
            /*
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.red)
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.green)
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.blue)
             */
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
                
            }
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
        
         
    }
}

struct TabBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TabBootCamp()
    }
}


// ExtractView is hold + command and select subview

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                Text("Home Tab")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Button (action: {
                    selectedTab = 2
                }, label: {
                    Text("Go to Profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .foregroundColor(.red)
                        .cornerRadius(10)
                })
            }
        }
    }
}
