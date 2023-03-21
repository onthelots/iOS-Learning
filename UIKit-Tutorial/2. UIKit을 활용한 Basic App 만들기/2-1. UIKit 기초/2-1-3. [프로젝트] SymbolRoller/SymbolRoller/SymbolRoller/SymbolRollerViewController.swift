//
//  SymbolRollerViewController.swift
//  SymbolRoller
//
//  Created by Jae hyuk Yim on 2023/03/09.
//

import UIKit

// UIViewController를 상속받은 SymbolRollerViewController의 Scene이다! (페이지를 나타내기 위한 객체)
class SymbolRollerViewController: UIViewController {
    
    // symbols을 배열로 미리 가져옴
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]

    
    // 앞선 화면에 올라온 컴포넌트(3개)를 Outlet 변수로 선언함!
    // MARK: - IBOutlet은 컴포턴트-코드 연결을 하겠다란 의미
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    // MARK: - View가 형성되는 Lifecycle (DidLoad -> willAppear -> DidAppear)
    
    // MARK: - 1. 해당 페이지 내 컴포넌트(UIImageView, Label, Button 등)가 메모리 내 로드되었다!
    // SwiftUI에서 활용되는 var body: some View 와 동일한 기능을 담당함
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 버튼 색상 설정 (아래와 같이, button의 색상도 이렇듯 코드로 적용시킬 수 있음)
        button.tintColor = UIColor.systemPink
        // TODO: - symbols에서 임의로 하나를 추출, 이미지와 텍스트를 일치시킴
        // symbol의 값은 확실히 있기 때문에, forced unwrapping을 실시함
//        let symbol = symbols.randomElement()!
        
        // imageView의 image 값으로, 위에서 선언한 랜덤한 symbol String 값을 할당함
//        imageView.image = UIImage(systemName: symbol)
        
        // 이후, label의 text값 또한 symbol String 값으로 설정을 하게되면
        // 결과적으로 이미지와 텍스트가 일치되게 됨
//        label.text = symbol
        reload()
    }
    
    // MARK: - 2. 메모리에 올라갔을 때, 보여질 것이며(Will Appear)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: - 3. 이후 나타날 것(DidAppear)이다!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - IBAction은 해당 컴포넌트가 실행됬을 시 나타나는 Action
    // 아래는 Button이 Action, 즉 눌릴때마다 나타나는 행동을 보여주는 함수임
    @IBAction func buttonTapped(_ sender: Any) {
        
        // 위 vieDidLoad() 메서드에서 구현해준 RandomElement()를 여기서도
        // 동일하게 구현한다면? -> 버튼이 눌릴때 마다 변경되는 것을 볼 수 있음!
//        let symbol = symbols.randomElement()!
//        imageView.image = UIImage(systemName: symbol)
//        label.text = symbol
        reload()
        print("버튼이 눌렸습니다.")
    }
    
    // MARK: - 중복되는 코드를 없애기 위한 메서드 생성
    // 근데, ViewDidLoad()와 buttonTapped() 메서드에서 중복되는 코드가 있음! -> 이러한 문제를, 개발자 사이에선 'DRY'라고함
    // 그래서, 아래와 같이 중복되는 코드를 reload()란 메서드로 만들어 줌
    func reload() {
        let symbol = symbols.randomElement()!
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
    }
}
