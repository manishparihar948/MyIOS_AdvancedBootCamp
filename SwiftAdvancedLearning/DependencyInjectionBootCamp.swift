//
//  DependencyInjectionBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 07.08.23.
//

import SwiftUI
import Combine

// PROBLMES WITH SIGLETON MODEL IS
// 1. SINGLETON ARE GLOBAL - that means the instance we can access from anywhere in our app
// We want to avoid global varibables as much as possible when developing apps
// most production apps dont even have global variables we dont want to accessed from any where in the app.
// 2. Can't customize the init!
// 3. Cant't swap out dependency - Our production data service always referencing the Productiondataservice.instance we always gonna end with class ProductionDataService {} so therefore we have to use class ProductionDataService  we cannot use another data service
// So the Solution is do not use singleton use dependency injections
// Instead of initializing our dependencies and in that case our dependency is going to be our data service instead of initializing it here within the data service we want to initialize it bit early on in our app, almost at the beginning of the app and then inject into the rest of the app all the views and view models that need a reference to the data service.

struct PostsModel :Identifiable, Codable {
    let userId: Int
    let id : Int
    let title: String
    let body: String
}



protocol DataServiceProtocol {
    
    func getData () -> AnyPublisher<[PostsModel], Error>
}
// Dependency Injection is basically an alternative to using the singleton design pattern
// So lets learn about the problem with singletons



class ProductionDataService {
    
    // instance we can access from anywhere in our app
    // static let instance = ProductionDataService() // Singleton Design Pattern
    
    // let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    // Now with dependency injection we can solve problem 2.
    let url : URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData () -> AnyPublisher<[PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // Jump on in main thread
            .eraseToAnyPublisher() // return data to any publisher and we gonna deal with the result in our view model
        
    }
}

// Testing or Development Purpose - fake version
class MockDataService : DataServiceProtocol {
    
    let testData: [PostsModel]
    
    init(data: [PostsModel]?){
        self.testData = data ?? [
            PostsModel(userId: 1, id: 1, title: "One", body: "one"),
            PostsModel(userId: 2, id: 2, title: "Two", body: "two"),
            
            ]
    }
        
    func getData () -> AnyPublisher<[PostsModel], Error> {
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
    
}



class DependencyViewModel: ObservableObject {
    
    @Published var dataArray: [PostsModel] = []
    var cancellable = Set<AnyCancellable>()
    
    // Create refrence for Dependency injection
    let dataService: DataServiceProtocol // ProductionDataService
    
    // This is the dependency injection in the nutshell its literally injecting our dependencies into our class or our struct.
    // So here we taking the data service which is our dependency and we are going to inject it through the init into this view model so that this view model has access to this data service
    
    init(dataService:DataServiceProtocol) { // ProductionDataService
        self.dataService = dataService
        loadPosts()
    }
    
    /*
    init() {
        loadPosts()
    }
    */
    
    private func loadPosts() {
        // Download the getData
        // When we get the data then store into the dataArray
        //ProductionDataService.instance.getData()
        dataService.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnedPosts in
                self?.dataArray = returnedPosts
            }
            .store(in: &cancellable) // We need to store the susbscriber somewhere so let create cancellable and store in it.

        
    }
    
    
}

struct DependencyInjectionBootCamp: View {
    
    // @StateObject private var vm = DependencyViewModel()
    @StateObject private var vm : DependencyViewModel
    
    init(dataService: DataServiceProtocol) {
        _vm = StateObject(wrappedValue: DependencyViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                     Text(post.title)
                }
            }
        }
    }
}

struct DependencyInjectionBootCamp_Previews: PreviewProvider {
    
   // static let dataService = ProductionDataService()
   //  static let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    static let dataService = MockDataService(data: [
        PostsModel(userId: 3, id: 3, title: "Test", body: "TestBody")
    ])
    
    static var previews: some View {
       // DependencyInjectionBootCamp()
        DependencyInjectionBootCamp(dataService: dataService) // Here we inject the data service into the view
    }
}
