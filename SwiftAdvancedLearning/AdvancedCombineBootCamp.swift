//
//  AdvancedCombineBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 11.08.23.
//

import SwiftUI

/*
What is Combine
Fetch data and come with an array and published that array into our view.
One of the Important parts of combine is that these publishers and subscriber
can stay alive even past the first publish.
*/

import Combine

class AdvancedCombineDataService {
    
    // This type array of string
    @Published var basicPublisher : [String] = []
    
    init() {
        publishedFakeData()
    }
    
    
    private func publishedFakeData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // But this is not combine
            self.basicPublisher = ["one","two","three"]
        }
    }
    
    
}


// Create ViewModel for this view
class AdvancedCombineBootCampViewModel: ObservableObject {
        
    // Data Array
    @Published var data: [String] = []
    
    // Initialize inside ViewModel the Dependency Inject because dataService might be shared with bunch of ViewModels or bunch of classes
    let dataService = AdvancedCombineDataService()

    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        // Dollar sign because its dependency injection
        dataService.$basicPublisher
            .sink { completion in
                switch completion {
                case .finished:
                     break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: {[weak self] returnedValue in
                self?.data = returnedValue // This is asynchronous code it will return value not immediately but whenever the values comebacks thatswhy we have to add self because its strong reference to the class AdvancedCombineBootCampViewModel being a pro developer we use [weak self]
              
            }
            .store(in: &cancellables)   // Now we need to store our subscriber somewhere so lets add combine framework
    }
}


struct AdvancedCombineBootCamp: View {
    
    @StateObject private var vm = AdvancedCombineBootCampViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.data, id: \.self) {
                   // Because we dont have item in data
                    Text($0)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
            }
        }
    }
}

struct AdvancedCombineBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCombineBootCamp()
    }
}
