import UIKit


// MARK: - 프로그래밍 패러다임 1. 명령형 프로그래밍


// MARK: - 순차적 프로그래밍(Sequential Programming), 비 구조적 프로그래밍(Non-structed programming)


var a: Int = 10
var b: Int = 20
//var sum: Int
//
//sum = a+b
//
var c: Int = 30
//
//
//sum = sum + c
//
//print(sum/3) // 20

// 궁극적으로, a,b,c의 평균값을 알고 싶기 때문에
// 순차적으로 a,b,c를 sum에 할당하고, sum을 3으로 나눠서 평균값을 구함
// 즉, state+state+state =


// MARK: - 절차적 프로그래밍 (Procedural Programming), 구조적 프로그래밍(Structed Programming)

var sum: Int = 0


// 프로시저 1
func multiple (firstNum: Int, secondNum: Int, thirdNum: Int) {
    
    sum = firstNum + secondNum
    
    if sum < 60 {
        sum = sum + thirdNum
    }
    
    print(sum)
}

multiple(firstNum: a, secondNum: b, thirdNum: c) // 60


// 프로시저 2
func average(input : Int) {
    
    var result = sum / 3
    
    print(result)
}

average(input: sum) // 20



