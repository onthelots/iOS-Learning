import UIKit

// MARK: - 프로퍼티의 종류
// 저장 프로퍼티 : 일반적으로 클래스 내 상수와 변수에 담기는 값
// 연산 프로퍼티 : 값을 설정하거나, 혹은 가져오는 시점에서 연산 메서드를 통한 값이 포함되는 프로퍼티

// MARK: - 예시 코드
//class BankAccount {
//    var accountNumber: Int = 0
//    var accountBalace: Float = 0
//
//    // 수수료
//    let fee: Float = 50.0
//
//    // 초기화
//    init(number: Int, balance: Float) {
//        accountNumber = number
//        accountBalace = balance
//    }
//}

// MARK: - 저장 프로퍼티

// 저장 프로퍼티 인스턴스 생성
// 해당 Class 내부에 저장된 변수나 상수값이며
//var saveProperty = BankAccount.init(number: 123456, balance: 100)

// 인스턴스 생성시, 초기값을 부여함으로서 재 저장됨
//saveProperty.accountBalace // 100
//saveProperty.accountNumber // 123456


// MARK: - 연산 프로퍼티
// 수수료를 뺀(연산) 현재 잔액을 '나타낼 수 있는' 변수/상수(프로퍼티) 또한 가능함 (저장하는 것이 아님!)
// 따라서, 반드시 연산프로퍼티 이외 타 저장 프로퍼티가 먼저 존재해야 함!

class BankAccount {
    var accountNumber: Int = 0
    var accountBalace: Float = 0

    // 수수료
    let fee: Float = 50.0
    
    // 값을 저장(저장 프로퍼티)하는 프로퍼티가 아니기 때문에, 반드시 타입명시를 해줘야 함!
    var balanceLessFees: Float {
        // 아래와 같이, 연산을 수행하는 getter(Get)를 추가함
        get {
            return accountBalace - fee
        }
        
        // 아래와 같이, 연산 프로퍼티인 balanceLessFees에 값을 대입하게 되면, set 함수가 실행됨!
        set(newValue) {
            accountBalace = newValue - fee
        }
    }
    
    // 초기화
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalace = balance
    }
}

// 인스턴스를 생성해보장
var presentBalance = BankAccount(number: 123456, balance: 100.0)
// get 내부 연산을 통해 잔액(accountBalance)에서 수수료(fee)를 뺀 값이 연산, 실행됨
presentBalance.accountBalace // 100.0

// 그래서, balanceLessFees를 호출한다면?
presentBalance.balanceLessFees // 50.0 (내부 연산을 진행한 값이 저장됨)

// set, 즉 balanceLessFees(잔액 - 수수료) 값을 100.0으로 임의 설정할 수 있음
presentBalance.balanceLessFees = 150

// 그렇게 된다면, setter 설정 scope로 넘어가게 되며,
// balanceLessFees란 연산프로퍼티의 파라피터(newValue)값으로 150이란 값이 설정
// accountBalace = 150 - 50으로 연산되므로
presentBalance.accountBalace // 100.0





class BankAccount2 {
    var accountNumber: Int = 0
    var accountBalace: Float = 0

    // 수수료
    let fee: Float = 50.0
    
    // 값을 저장(저장 프로퍼티)하는 프로퍼티가 아니기 때문에, 반드시 타입명시를 해줘야 함!
    var balanceLessFees: Float {
        // 아래와 같이, 연산을 수행하는 getter(Get)를 추가함
        get {
            return accountBalace - fee
        }
        
        // 아래와 같이, 연산 프로퍼티인 balanceLessFees에 값을 대입하게 되면, set 함수가 실행됨!
        set(newBalance) {
            accountBalace = newBalance - fee
        }
    }
    
    // 초기화
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalace = balance
    }
}


// 1차 인스턴스
var computedProperty = BankAccount2(number: 123, balance: 100.0)


// computedProperty의 값을 받아오는 myAccount 인스턴스 생성
var myAccount = computedProperty.balanceLessFees // 50

// 1. 저장 프로퍼티(get)에서 balanceLessFees를 반환한다면?
computedProperty.balanceLessFees // 50이란 값이 호출됨 (100-50)


// 2. 근데, Set를 통해 해당 연산 프로퍼티를 매개변수로 가져와 newValue 값에 할당해서 돌려버리면?
computedProperty.balanceLessFees = 100 // 100이란 값을 임의로 할당

// accountBalance는 100(newValue) - 50(fee) 50이란 값이 쓰여지게(Set, write) 됨!
computedProperty.accountBalace // 50

// 그렇다면, balanceLessFees를 다시 호출하게 되면 어떤 값이 나오게 될까?
computedProperty.balanceLessFees // 0
