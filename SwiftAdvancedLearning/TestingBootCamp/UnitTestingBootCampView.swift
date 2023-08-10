//
//  UnitTestingBootCampView.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 07.08.23.
//

/*
 1. Unit Tests
 - test the business logic in our app
 
 2. UI Tests
 - test the UI of our app
*/


import SwiftUI

struct UnitTestingBootCampView: View {
    
    @StateObject private var vm : UnitTestingBootCampViewModel
    
    // we are injecting premium value into UnitTestingBootCampViewModel
    init(isPremium: Bool){
        _vm = StateObject(wrappedValue: UnitTestingBootCampViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTestingBootCampView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingBootCampView(isPremium: true)
    }
}
