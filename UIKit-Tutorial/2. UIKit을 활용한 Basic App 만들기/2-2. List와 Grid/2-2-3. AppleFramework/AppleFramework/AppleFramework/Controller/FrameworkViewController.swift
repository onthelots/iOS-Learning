//
//  FrameworkViewController.swift
//  AppleFramework
//
//  Created by Jae hyuk Yim on 2023/03/21.
//

import UIKit

class FrameworkViewController: UIViewController {

    // MARK: - CollectionView 연결
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Model 연결 (배열 인스턴스 생성)
    let appleFrameworks: [AppleFramework] = AppleFramework.list
    
    // MARK: - Data, Preesentation, Layer
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // MARK: - estimate size의 옵션(none, Automatic 등) 조정 (CollectionView의 Inspector에서도 조정할 수 있음)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
        }
        
        // MARK: - Inset(위, 아래, 양 옆 Padding값 부여하기)
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)

    }
}

// MARK: - 1. date 및 Presentation 연결
extension FrameworkViewController: UICollectionViewDataSource {
    
    // 데이터 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appleFrameworks.count
    }
    
    // Presentation (cell을 보여줄 ViewController의 데이터를 연결)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        // 데이터 가져오기 (indexPath.item 수정자)
        let framework = appleFrameworks[indexPath.item]
        cell.configure(framework)
        return cell
    }
}

// MARK: - 2. 레이아웃
extension FrameworkViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 내부 Spacing
        let interItemSpacing: CGFloat = 10
        
        // Inset (위, 아래, 양 옆)
        let padding: CGFloat = 16
        
        // MARK: - ★★ CollectionView의 width, height를 설정 (틀을 잡는다)
        // bounds.width 수정자 값에 - 위에서 선언한 Spacing값의 2배수를 빼고(왜? 사이, 사이에 Spacing이 2칸 들어가 있으니) 거기에 3을 나누게 되면?
        // 사이에 10만큼의 Spacing, 그리고 가로 Cell에 3개의 데이터가 들어감
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    // MARK: - InteritemSpacing (양옆 셀간의 간격 padding)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    // MARK: - Line Spacing (위 아래 셀간의 간격 padding) (minimumLineSpacingForSectionAt)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
