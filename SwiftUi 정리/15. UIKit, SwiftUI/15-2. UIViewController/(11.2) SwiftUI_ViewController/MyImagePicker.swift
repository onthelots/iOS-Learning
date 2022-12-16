//
//  MyImagePicker.swift
//  (11.2) SwiftUI_ViewController
//
//  Created by Jae hyuk Yim on 2022/11/02.
//

import SwiftUI

struct MyImagePicker: UIViewControllerRepresentable {

    
    // ContentView에서 선언한 상태 프로퍼티를 바인딩
    @Binding var imagePickerVisible: Bool
    @Binding var selectImage: Image?
    
    
    // UIViewRepresentable과 같이, 2가지 필수 메서드를 작성해야 함
    // 1. 첫번째 메서드인 makeUIViewController
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyImagePicker>) -> UIImagePickerController {

        // 인스턴스 생성하고,
        let picker = UIImagePickerController()

        // 초기화는??
        // delegate는 책임을 다른 객체로 넘기는 것이고,
        // coordinator는 그 수행을 실제로 하는 추가적인 이벤트 작업임
        // 즉, 인스턴스로 생성된 picker
        picker.delegate = context.coordinator


        // 해당 프로퍼티를 반환함
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<MyImagePicker>) {
        // update
    }
    
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePickerVisible: $imagePickerVisible, selectImage: $selectImage)
    }
    
    
    
    
    // Coordinator 생성!
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var imagePickerVisible: Bool
        @Binding var selectImage: Image?
        
        // 초기화
        init(imagePickerVisible: Binding<Bool>, selectImage: Binding<Image?>) {
            _imagePickerVisible = imagePickerVisible
            _selectImage = selectImage
        }
        
        }
        
    
} // --- MyImagePicker













struct MyImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        MyImagePicker(imagePickerVisible: Binding<Bool>, selectImage: Binding<Image>)
    }
}
