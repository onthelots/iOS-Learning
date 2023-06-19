//
//  ViewController.swift
//  Bar_Graph
//
//  Created by Jae hyuk Yim on 2023/06/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var barStackView: UIStackView!
    
    // 수치가 저장되는 변수 value
    private var values: [CGFloat] = []
    
    // 범위
    private var horizontalRange = (1...12)
    
    // bar 높이를 모아놓은 제약 배열
    private var barHeightConstraints: [NSLayoutConstraint] = []
    
    // Multipliers를 통한 bar 높이 결정(배수)
    private var barHeightMultipliers: [CGFloat] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBars()
        randomizeValue()
    }
    // randomizeValue -> 해당 bar의 수치인 value의 값을 랜덤으로 설정해줌
    // values 배열의 갯수인 12개를 할당하기 위해, horizontalRange (CloseRange<Int>)를 매핑해서 돌려줌
    private func randomizeValue() {
//        for _ in horizontalRange {
//            values = [CGFloat.random(in: 0...100)]
//        }
        values = horizontalRange.map({ _ in
            CGFloat.random(in: 0...100)
        })
    }
    
    // Constraints
    private func addConstraint() {
        barHeightConstraints.forEach { (constraints) in
            constraints.isActive = false // 가지고 있는 제약이 있다면, 무력화
            
            // barHeightConstraints의 값은, multipliers와 barStackView의 SubView를 결합했는데 -> 각각 배열 요소별로 들어오는 heightAnchor는 barSTackView의 높이 X multiplier 값으로 결정됨
            barHeightConstraints = zip(barHeightMultipliers, barStackView.arrangedSubviews).map {
                $1.heightAnchor.constraint(equalTo: barStackView.heightAnchor, multiplier: $0)
            }
            
            // 활성화
            NSLayoutConstraint.activate(barHeightConstraints)
        }
    }
    
    // drawBars()
    private func drawBars() {
        horizontalRange.forEach { (x) in
            let bar = UIView()
            bar.backgroundColor = .blue
            barStackView.addArrangedSubview(bar)
        }
    }
    
    @IBAction func randomValueButton() {
        // barHeightMultiplier의 값을 랜덤하게 돌려주면 될듯
    }
}

