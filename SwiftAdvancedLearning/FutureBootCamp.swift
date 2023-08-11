//
//  FutureBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 11.08.23.
//

import SwiftUI
import Combine

// Download with Combine -> this function have publisher and subscriber
// Download with @escaping closure -> Before using combine we use escaping for asynchronous code
// Convert @escaping clouser to Combine

class FutureBootCampViewModel: ObservableObject {
    
    @Published var title: String = "Starting Title"
    let url = URL(string: "https://www.google.com")!
    var cancellable = Set<AnyCancellable>()
    
    init() {
        download()
    }
    
    func download() {
        // lets download using publisher
        // getCombinePublisher()
        getFuturePublisher()
            .sink { _ in

            } receiveValue: {[weak self] returnedValue in
                self?.title = returnedValue
            }
            .store(in:&cancellable)

//        getEscapingClosure { [weak self] returnedValue, error in
//            self?.title = returnedValue
//        }
        
    }
    
    
    // When we have publisher we can use combine
    func getCombinePublisher() -> AnyPublisher<String, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1, scheduler: DispatchQueue.main)
            .map({ _ in
                return "New value"
            })
            .eraseToAnyPublisher()
    }
    
    // However before combine we have @escaping,
    func getEscapingClosure(completionHandler:@escaping(_ value: String, _ error:Error?)->() ) {
        // We took a function with escaping closure, there is no publisher and subscriber in this funtion,the function has data coming back and completion handler, this is we used to do it prior to ios13
        URLSession.shared.dataTask(with: url) { data, UNNotification, error in
            completionHandler("New value 2", nil)
        }
        .resume()
    }
    
    // Way to use combine publisher with escaping
    func getFuturePublisher() -> Future<String, Error> {
        // All we have to do wrap funtion inside Future
         Future { promise in
             // And we fill the promise based on returnedVaue
            self.getEscapingClosure { returnedValue, error in
                if let error = error {
                    promise(.failure(error))
                }else {
                    promise(.success(returnedValue))
                }
            }
        }
    }
    
    func doSomething(completion:@escaping (_ value:String) -> () ) {
        DispatchQueue.main.asyncAfter(deadline:.now() + 4){
            completion ("New String")
        }
    }
    
    func doSomethingInFuture()-> Future<String, Never> {
        Future { promise in
            self.doSomething { returnedValue in
                promise(.success(returnedValue))
            }
        }
    }
}

struct FutureBootCamp: View {
    
    @StateObject private var vm = FutureBootCampViewModel()
    
    var body: some View {
        Text(vm.title)
    }
}

struct FutureBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        FutureBootCamp()
    }
}
