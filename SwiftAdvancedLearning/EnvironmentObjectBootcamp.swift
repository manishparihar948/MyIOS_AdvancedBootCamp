//
//  EnvironmentObjectBootcamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 29.08.23.
//

import SwiftUI

// ObservedObject
// StateObject
// EnvironmentObject - it is same as StateObject


class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray : [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone","iPad","iWatch","iMac","iPod"])
    }
}

struct EnvironmentObjectBootcamp: View {
    
    // As soon as call EnvironmentViewModel() its called init()
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.dataArray,id: \.self){ item in
                    NavigationLink(
                        //destination:DetailScreen(selectedItem: item, viewModel: viewModel),
                        // We dont need to pass viewModel here as we passed .environmentObject
                        destination:DetailScreen(selectedItem: item),
                        label:  {
                            Text(item)
                        })
                }
            }
            .navigationTitle("iOS Devices")
        }
        .environmentObject(viewModel) // All Subviews has access to this viewModel from environmentObject variable so we dont need
    }
}

// Second Screen
struct DetailScreen : View {
    
    let selectedItem: String
    
   // @ObservedObject var viewModel:EnvironmentViewModel
    
   // All Subviews has access to this viewModel from environmentObject variable so we dont need @ObservedObject
    
    
    var body: some View {
        ZStack {
            // Background
            Color.orange.ignoresSafeArea()
            
            // Foreground
            NavigationLink(
                //destination: FinalScreen(viewModel: viewModel),
                // We dont need viewModel here because we have passed EnvironmentObject
                destination: FinalScreen(),
                label: {
                    Text(selectedItem)
                        .font(.headline)
                        .foregroundColor(.orange)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(30)
                } )
        }
    }
}

// Third Screen
struct FinalScreen : View {
    
   // @ObservedObject var viewModel:EnvironmentViewModel
   // All Subviews has access to this viewModel from environmentObject variable so we dont need
    @EnvironmentObject var viewModel:EnvironmentViewModel
        
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                gradient: Gradient(colors: [Color(.purple), Color(.systemPink)]),
                startPoint: .leading,
                endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            // Foreground
            ScrollView {
                VStack(spacing:20) {
                    ForEach(viewModel.dataArray, id:\.self){  item in
                        Text(item)
                    }
                    .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(30)
                }
                .padding()
            }
        }
    }
}


struct EnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectBootcamp()
       // DetailScreen(selectedItem: "iPhone")
       // FinalScreen()
    }
}
