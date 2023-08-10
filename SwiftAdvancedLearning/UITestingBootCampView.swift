//
//  UITestingBootCampView.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 10.08.23.
//

import SwiftUI

class UITestingBootCampViewModel : ObservableObject {
    let placeholderText: String = "Add your name..."
    @Published var textFieldText:String = ""
    @Published var currentUserIsSignedIn : Bool
    
    init(currentUserIsSignedIn: Bool) {
        self.currentUserIsSignedIn = currentUserIsSignedIn
    }
    
    func signUpButtonPressed() {
        guard !textFieldText.isEmpty else {return}
        currentUserIsSignedIn = true
    }
}

struct UITestingBootCampView: View {
    
    @StateObject private var vm : UITestingBootCampViewModel
    
    init(currentUserIsSignedIn: Bool) {
        _vm = StateObject(wrappedValue: UITestingBootCampViewModel(currentUserIsSignedIn: currentUserIsSignedIn))
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .topLeading, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            ZStack {
                if vm.currentUserIsSignedIn {
                    // content
                    SignedInHomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .trailing))
                }
                if !vm.currentUserIsSignedIn {
                    signUpLayer
                        .transition(.move(edge: .leading))
                }
            }
           
        }
    }
}

struct UITestingBootCampView_Previews: PreviewProvider {
    static var previews: some View {
        UITestingBootCampView(currentUserIsSignedIn: true)
    }
}

extension UITestingBootCampView {
    
    private var signUpLayer: some View {
        VStack {
            TextField(vm.placeholderText, text: $vm.textFieldText)
                .font(.headline)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .accessibilityIdentifier("SignUpTextField")
            
            Button(action: {
                withAnimation(.spring()){
                    vm.signUpButtonPressed()
                }
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .accessibilityIdentifier("SignUpButton")
            })
            
        }.padding()
    }
}

struct SignedInHomeView: View {
    @State private var showAlert:Bool = false
    var body: some View {
        NavigationView{
            VStack(spacing:20){
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Text("Show welcome alert")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(10)
                })
                .accessibilityIdentifier("ShowAlertButton")
                .alert(isPresented: $showAlert, content: {
                    return Alert(title: Text("Welcome to the app"))
                })
                
                NavigationLink(
                    destination:Text("Destination"),
                    label: {
                        Text("Navigate")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                .accessibilityIdentifier("NavigationLinkToDestination")
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}
