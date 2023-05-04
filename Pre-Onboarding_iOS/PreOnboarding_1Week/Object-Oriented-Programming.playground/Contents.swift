import UIKit
import Foundation

// MARK: - ➑ 일급 컬렉션을 사용한다
class Stack<Item> {
    private var items: [Item] = []
    
    func push(_ item: Item) {
        items.append(item)
    }
    
    func pop() -> Item {
        return items.removeLast()
    }
}

var intStack = Stack<Int>() // 빈 배열로 생성해주면..

intStack.push(3)


// MARK: - ➒ getter / setter를 구현하지 않는다.

class Person {
    
    // 캡슐화를 위해, private를 선언함
    
    private var money: Double = 0
    
    // 객체에게 일을 시키기
    func showMoney() {
        print("내 돈은 이만큼이다! : \(money)")
    }
    
    // 객체에게 일을 시키기
    func giveMoney(_ amount :Double) {
        money += amount
    }
}

let yagom: Person = Person()

yagom.giveMoney(123456)
yagom.showMoney() // 내 돈은 이만큼이다! : 123456.0
