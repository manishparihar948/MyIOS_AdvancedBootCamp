//
//  StateAndObservableObject.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 28.08.23.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel : ObservableObject {
    // Everytime it push or publish the objec to the class, when the object is updated we know its going to observe in View
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    // Instead of calling api call on .onAppear better to call it in ViewModel init as code run and reach @StateObject var fruitViewModel : FruitViewModel = FruitViewModel() it will call init function and hit get fruits.
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 =  FruitModel(name: "Apples", count: 5)
        let fruit2 =  FruitModel(name: "Banana", count: 15)
        let fruit3 = FruitModel(name: "Oranges", count: 10)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
    }
    
    func deleteFruit(index:IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

// @Published is same as @State but only difference is its called inside class

struct StateAndObservableObject: View {
    
   // @State var fruitArray: [FruitModel] = []
    
   // This viewmodel tell the view this model might be changing we need to update our view so going to use @ObservedOBject
   // Problem with @ObservedObject, let say if View got refresh or updated or animated for any reason, unfortunately this @ObservedObject also reloads, And we want kind of persist data we use property wrapper like @StateObject so if View get updated the fruitViewModel should not get reload or refresh.
   // But if we passing the (fruitViewModel) object to Second-View or Sub-View then we use @ObsesrvedObject
   // @ObservedObject var fruitViewModel : FruitViewModel = FruitViewModel()

   
   // @StateObject -> USE THIS FOR CREATION / INIT
   // @ObservedObject -> USE THIS FOR SUBVIEWS
   
    @StateObject var fruitViewModel : FruitViewModel = FruitViewModel()
   // @ObservedObject var fruitViewModel : FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray){ fruit in
                        HStack {
                            Text(fruit.name)
                                .font(.headline)
                            
                            Text("\(fruit.count)")
                                .font(.headline)
                                .foregroundColor(.red)
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .navigationTitle("Fruit List")
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: RandomScreen(fruitViewModel:fruitViewModel),
                                        label: {
                                            Image(systemName: "arrow.right")
                                                .font(.title)
                                        })
                                )
        }
    }
}

struct RandomScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .font(.headline)
                }
            }

        }
    }
}


struct StateAndObservableObject_Previews: PreviewProvider {
    static var previews: some View {
         StateAndObservableObject()
       // RandomScreen()
    }
}
