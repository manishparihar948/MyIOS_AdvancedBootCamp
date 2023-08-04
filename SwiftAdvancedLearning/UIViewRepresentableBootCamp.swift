//
//  UIViewRepresentableBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 04.08.23.
//

import SwiftUI

// Convert a UIView from UIKit to SwiftUI
struct UIViewRepresentableBootCamp: View {
    @State private var text: String = ""
    var body: some View {
        VStack {
            Text(text)
            // Basic call of UIViewRepresentable
            //        BasicUIViewRepresentable()
            HStack {
                Text("SwiftUI:")
                TextField("Type here ...", text: $text)
                    .frame(height: 55)
                    .background(Color.secondary)
            }
            
            HStack {
                Text("UIKit:")
                UITextFieldViewRepresentable(text: $text)
                    .updatePlaceholder("NEW PLACEHOLDER")
                        .frame(height: 55)
                        .background(Color.gray)
            }
           
        }

    }
}

struct UIViewRepresentableBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepresentableBootCamp()
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    // Binding Textfield with Label
    @Binding var text: String
    var placeholder:String
    let placeholderColor: UIColor
    
    init(text: Binding<String>, placeholder: String = "Default Placeholder...", placeholderColor: UIColor = .red) {
        
        self._text = text
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
    }
    
    // Xcode doesnot know if we send data to view or textfield so we make UITextfield
    func makeUIView(context: Context) -> UITextField {
      let textfield = getTextField()
        textfield.delegate = context.coordinator
        return textfield
    }
    
    // Send data from SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    // Send data from UIKit  to SwiftUI
    // How to bind Text with textfield, so we are using coordinator
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    // create class for coordinatior
    class Coordinator: NSObject ,UITextFieldDelegate {
      
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
    
    // create private function and call insside makeUIView
    private func getTextField() -> UITextField {
        let textfield = UITextField(frame: .zero)
        let placeholder = NSAttributedString (
            string: placeholder,
            attributes: [
                .foregroundColor : placeholderColor
            ])
        textfield.attributedPlaceholder = placeholder
        return textfield
    }
    
    func updatePlaceholder(_ text:String) -> UITextFieldViewRepresentable {
        var viewRepresentable = self
        viewRepresentable.placeholder = text
        return viewRepresentable
    }
    
    
}




struct BasicUIViewRepresentable:UIViewRepresentable {
    // Two part of UIViewRepresentable 1. make and 2. update
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

