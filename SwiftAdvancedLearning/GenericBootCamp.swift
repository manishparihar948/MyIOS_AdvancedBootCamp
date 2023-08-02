//
//  GenericBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 02.08.23.
//

import SwiftUI

// We dont need these two stuct

struct StringModel {
    let info:String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

struct BoolModel {
    let info:Bool?
    
    func removeInfo() -> BoolModel {
        BoolModel(info: nil)
    }
}

// Create Generic Type we want any type
struct GenericModel<T> {
    let info:T?
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericViewModel : ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello world")
    @Published var boolModel = BoolModel(info: true)
    
    @Published var genericStringModel = GenericModel(info: "Hello Manish")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
    
//
//    // Array accept any tpye thatswhy we call generic type
//    @Published var dataArray: [String] = []
//
//    init() {
//        dataArray = ["one","two","three"]
//    }
//
//    func removeDataFromDataArray() {
//        dataArray.removeAll()
//    }
}


struct GenericView<T: View>: View {
    
    let content : T
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
            content
        }
    }
}


struct GenericBootCamp: View {
    
    @StateObject private var vm = GenericViewModel()
    
    var body: some View {
        VStack {
            GenericView(content: Text("custom content"), title: "New View!!")
//            GenericView(title: "New View!!")
//            ForEach(vm.dataArray, id: \.self) { item in
//                Text(item)
//                    .onTapGesture {
//                        vm.removeDataFromDataArray()
//                    }
//            }
            Text(vm.stringModel.info ?? "no data")
            Text(vm.boolModel.info?.description ?? "no data")
                
            
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

struct GenericBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericBootCamp()
    }
}
