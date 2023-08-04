//
//  UIViewControllerRespresentableBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 04.08.23.
//

import SwiftUI

struct UIViewControllerRespresentableBootCamp: View {
    @State private var showScreen: Bool = false
    // We want to send back image from subview (UIKit to swiftui)
    
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            Text("Hi")
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            Button (action: {
                showScreen.toggle()
            }, label: {
                Text("Click Here")
            })
            .sheet(isPresented: $showScreen, content: {
                // So do that image we need binding with UIImagePickerControllerRepresentable
                UIImagePickerControllerRepresentable(image: $image, showScreen: $showScreen)
              //  BasicViewControllerRepresentable(labelText: "My new label")
            })

        }
    }
}

struct UIViewControllerRespresentableBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerRespresentableBootCamp()
    }
}

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var showScreen:Bool
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
        return vc
    }
    
    // From SwiftUI to UIKit
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    // We need coordination to send image to coordinate
    // From UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(image:$image, showScreen: $showScreen)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var image : UIImage?
        // Dismiss UIImageViewController Screen
        @Binding var showScreen:Bool
        
        init(image: Binding<UIImage?>, showScreen:Binding<Bool> ) {
            self._image = image
            self._showScreen = showScreen
            }
        
        func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey: Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            image = newImage
            showScreen = false
        }
    }
    
    
}

struct BasicViewControllerRepresentable: UIViewControllerRepresentable {
    
    let labelText : String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let vc =  MyFirstViewController()
        vc.labelText = labelText
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


class MyFirstViewController: UIViewController {
    
    var labelText: String = "Starting Value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor.white
        view.addSubview(label)
        label.frame = view.frame
    }
}
