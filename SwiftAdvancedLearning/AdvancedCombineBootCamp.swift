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
    // @Published var basicPublisher : [String] = []
    
    // @Published var basicPublisher : String = "first publish"   // this publisher is still alive
    
    // let currentValuePublisher = CurrentValueSubject<String, Error>("first publish")
    //let passThroughPublisher = PassthroughSubject<String, Error>()
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishedFakeData()
    }
    
    
    private func publishedFakeData() {
        // let items =  ["one","two","three"]
        let items: [Int] =  Array(0..<11)
        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.basicPublisher = ["one","two","three"]
        }
        */
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                // But this is not combine
                // self.basicPublisher = items[x]
                //self.currentValuePublisher.send(items[x])
                self.passThroughPublisher.send(items[x])
            }
        }
        
    }
    
    
}


// Create ViewModel for this view
class AdvancedCombineBootCampViewModel: ObservableObject {
        
    // Data Array
    @Published var data: [String] = [] // this publisher is still alive
    
    // Initialize inside ViewModel the Dependency Inject because dataService might be shared with bunch of ViewModels or bunch of classes
    let dataService = AdvancedCombineDataService()

    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        // Dollar sign because its dependency injection
        //dataService.$basicPublisher
        //dataService.currentValuePublisher
        dataService.passThroughPublisher
        
        // Sequence Operations
        
        // Mathematic Operations
        
        // Filter / Reducing Operations
        
        // Timing Operations
            // .debounce(for: 1, scheduler: DispatchQueue.main)
        
        // Multiple Publisherss / Subscribers
        
            .map({String($0)})
            .sink { completion in
                switch completion {
                case .finished:
                     break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: {[weak self] returnedValue in
               // self?.data = returnedValue // This is asynchronous code it will return value not immediately but whenever the values comebacks thatswhy we have to add self because its strong reference to the class AdvancedCombineBootCampViewModel being a pro developer we use [weak self]
                self?.data.append(returnedValue)
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
