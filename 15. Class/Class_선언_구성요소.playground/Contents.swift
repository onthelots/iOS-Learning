import UIKit

// 뒤에 나오는 클래스 생성과 구성요소, 활용방식에 대해 알아보기 위해 아래 예시를 활용함
// MARK: - 은행계좌(BankAccount)에 대한 클래스
// class BankAccount {
// }

// MARK: - 1. 클래스의 선언
// 객체를 인스턴스(구체화)하기 위해, 청사진인 클래스를 정의해야 함
/*
 class 새로운 클래스 이름 : 부모 클래스 {
    // 프로퍼티(Properties)
    // 인스턴스 메서드(instance method) -> 호출되는 메서드
    // 타입 메서드(Type method) -> 해당 클래스 자체의 인스턴스
 */


// MARK: - 2. 프로퍼티(인스턴스 프로퍼티) 추가
// 클래스 내 캡슐화 된 데이터를 프로퍼티 또는 인스턴스 변수라고 부름
// BankAccount의 프로퍼티 -> 계좌번호, 계좌에 남은 잔고

//class BankAccount {
//    var accountBalace: Float = 0
//    var accountNumber: Int = 0
//}

// MARK: - 3. 메서드(method) 추가
// 인스턴스 메서드 : 클래스의 인스턴스를 생성한 후, 작업(산술연산 외)하는 용도
//class BankAccount {
//    var accountBalace: Float = 0
//    var accountNumber: Int = 0
//
//    func displayBalance() {
//        print("계좌번호 : \(accountNumber)")
//        print("잔액 : \(accountBalace))")
//    }
//}


// 타입메서드 : 클래스 레벨(클래스의 새로운 인스턴스 생성하기 등)을 설정하는 용도
//class BankAccount {
//    var accountBalace: Float = 0
//    var accountNumber: Int = 0
//
//    func displayBalance() {
//        print("계좌번호 : \(accountNumber)")
//        print("잔액 : \(accountBalace))")
//    }
//
//    // 현재 클래스에 저장할 수 있는 최대 금액을 파악할 수 있는 타입 메서드
//    func getMaxBalance() -> Float {
//        return 100000.00
//    }
//}


// MARK: - 4. 클래스의 인스턴스 선언하고 초기화하기
// 기존에 선언한 클래스를 사용하기 위해선, 클래스의 인스턴스를 생성해야 함!
// 참조체를 저장할 수 있는 변수를 선언하는 단계에서 시작함
//var account: BankAccount = BankAccount()


// MARK: - 5. 새로운 클래스의 인스턴스의 값을 초기화(init) 하기
// 초기화? 또?
// 만약, 해당 인스턴스가 아닌, 새로운 인스턴스를 선언할 시, 계좌번호와 잔액을 초기화 할 필요가 있음
// 이는, 기존 BankAccount 클래스 내부에 init() 메서드를 활용해서 작성함

//class BankAccount {
//    var accountBalace: Float = 0
//    var accountNumber: Int = 0
//    
//    // 새로운 인스턴스를 생성할 때마다, 직접 계좌번호와 잔액을 초기화 할 수 있도록
//    // init 메서드를 작성 -> 프로퍼티를 활용해, 일종의 매개변수를 만들어 준다고 생각하면 편함
//    init(number: Int, balance: Float ) {
//        accountNumber = number
//        accountBalace = balance
//    }
//    
//    deinit {
//        print("deinit Person class instance")
//    }
//    
//    func displayBalance() {
//        print("계좌번호 : \(accountNumber)")
//        print("잔액 : \(accountBalace)")
//    }
//    
//    // 현재 클래스에 저장할 수 있는 최대 금액을 파악할 수 있는 타입 메서드
//    class func getMaxBalance() -> Float {
//        return 100000.00
//    }
//}

// 그렇게 되면, 새로운 인스턴스를 생성할 때, 계좌번호와 잔액을 초기화(사용자 임의 값 대입)할 수 있음
//var account1: BankAccount = BankAccount(number: 123456, balance: 78.9)

//account1.accountNumber // 123456
//account1.accountBalace // 78.9

// MARK: - 6. 새로운 클래스의 인스턴스의 값을 소멸화(deinit) 하기
// 소멸? 만약, 클래스의 인스턴스가 없어지는 과정에서 기존에 초기화 된 값을 없앨 필요가 있음

//var account2: BankAccount? = BankAccount(number: 654321, balance: 98.7)
//
//account2 = nil // deinit Person class instance // 메모리가 해제되었다!
//
//account2?.accountBalace // 이후에는 nil값만이 호출됨



// MARK: - 6. 인스턴스에서 메서드 호출과 프로퍼티 접근하기
// 점 표기법(dot notation)을 통해 쉽게 호출하고, 접근할 수 있다!

/*
 인스턴스.프로퍼티명
 인스턴스.인스턴스메서드()
 */

// 프로퍼티 값 접근
account1.accountNumber // 123456

// 프로퍼티 값 변경(설정)
account1.accountNumber = 78910
account1.accountNumber // 78910

// 클래스 인스턴스 호출
account1.displayBalance()
/*
 계좌번호 : 78910
 잔액 : 78.9
 */

// 타입 메서드는, 인스턴스가 아닌 클래스 자체에서 호출되어야 함!
BankAccount.getMaxBalance() // 100000

