//
//  ContentView.swift
//  (11.2) SwiftUI_ViewController
//
//  Created by Jae hyuk Yim on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
        
        // View 조정을 위하여 상태 프로퍼티를 선언한다.
        @State var imagePickerVisible: Bool = false
        
        // 왜 옵셔널? 고를수도 있고, 안 고를 수도 있기 때문에
        @State var selectImage: Image? = Image(systemName: "photo")
        
        
    var body: some View {
        ZStack {
            VStack {
                // Image가 있는지, 없는지 판단해서 -> Coodinators를 활용할 수 있다!
                selectImage?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                
                
                Button(action: {
                    // action
                    imagePickerVisible.toggle()
                }) {
                    Text("Select an Image")
                        .font(.title)
                    
                    
                }
            }
            
            
            // MYImagePicker() 구조체를 ZStack 안에 넣어준다!
            // imagePickerVisible 프로퍼티를 활용
            if (imagePickerVisible) {
                MyImagePicker(imagePickerVisible: $imagePickerVisible, selectImage: $selectImage)
            }
            
        }
    } // --- body
} // --- Content View




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
