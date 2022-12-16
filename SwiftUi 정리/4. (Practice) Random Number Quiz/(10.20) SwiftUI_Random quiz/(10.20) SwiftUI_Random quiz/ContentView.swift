//
//  ContentView.swift
//  (10.20) SwiftUI_Random quiz
//
//  Created by Jae hyuk Yim on 2022/10/20.
//

import SwiftUI

struct ContentView: View {
    
    // inputNumber는 아래 TextField에 직접 넣어주는 값!
    @State private var inputNumber:String = ""
    @State private var outputNumber: String = ""
    
    // 아래 두 상태 프로퍼티는, correct or incorrect 할 경우 나타내는 문자열!
    @State private var correct: String = "Correct!"
    @State private var incorrect: String = "inCorrect!"
    @State private var emptyValue: String = "press the Random Button..."
    
    // NumberGenerator 구조체의 기능을 받아오는 상태 프로퍼티!
    @State private var generator = NumberGenerator()
    
    
    
    
    var body: some View {
        
        // 타이틀
        VStack(alignment: .center) {
            Text("Guess the \nNumber!")
                .font(.largeTitle)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.top, 100.0)
                .frame(minWidth: 200.0, minHeight: 200.0)
            
            Text("First, press the Random Button")
                .padding(.top, 50.0)
                .fontWeight(.ultraLight)
        
            
            Button {
                outputNumber = "Enter the Number"
                // randomNumber의 범위를 0부터 10까지 잡아주고..
                generator.selectRandomNum(numberRange: 0..<10)
                print("generate random Number")
                print("random Number is :\(generator.number)")
            } label: {
                Image(systemName: "dice")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.indigo)

                Text("Random\nNumber")
                    .font(.title3)
                    .foregroundColor(.indigo)
            }
            .frame(minWidth: 150.0, minHeight: 150.0)
            
            Divider()
            
            // 메세지를 출력해 주는 텍스트 필드
            TextField("Press Start Button", text: $outputNumber)
                .padding(10.0)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            
            // inputNumber를 작성하는 텍스트 필드
            TextField("Enter the number", text: $inputNumber)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
            
            
            Spacer()
            
                
                // 조건문을 통해 inputNumber가 비어있을때와 맞지 않을때, 정답일경우를 나타내고
                // 맨 위에 선언한 상태 프로퍼티에 따라 inputNumber의 값을 바꿔서 출력해줌

                
                HStack {
                    // CalCulate Button
                    Button(action : {
                        
                        if inputNumber.isEmpty {
                            print("Number is Empty")
                            outputNumber = emptyValue
                            
                        } else if inputNumber.count > 0 && Int(inputNumber) == generator.number {
                            print("Corret Number!")
                            outputNumber = correct
                            
                        } else {
                            print("InCorrect")
                            outputNumber = incorrect
                        }
                        inputNumber = ""
                        
                    }, label : {
                        Image(systemName: "checkmark.circle")
                            .imageScale(.large)
                            .font(.largeTitle)
                            .foregroundColor(.accentColor)
                        Text("Start")
                            .font(.title)
                            .foregroundColor(Color.accentColor)
                    })
                    .padding(.all)
                    
                    
                    
                    // Reset Button
                    Button(action : {
                        inputNumber = ""
                        outputNumber = ""
                    }, label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .imageScale(.large)
                            .font(.largeTitle)
                            .foregroundColor(Color.orange)
                        Text("Reset")
                            .font(.title)
                            .foregroundColor(Color.orange)
                    })
                    .padding(.all)
                }
                .padding(.top, 100.0)
                .padding(.bottom, 50.0)
            }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
