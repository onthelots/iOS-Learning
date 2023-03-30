//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by joonwon lee on 2022/05/01.
//

import UIKit

class FocusViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshButton: UIButton!
    
    var curated: Bool = false
    var items: [Focus] = Focus.list
    
    typealias Item = Focus
    enum Section {
        case main
    }
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton.layer.cornerRadius = 10
        
        // Presentation: Diffable Datasource + Cell Provider
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // Data: Snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
        
        // Layout
        collectionView.collectionViewLayout = layout()
        
        // MARK: - delegate 설정
        collectionView.delegate = self
        
        updateButtonTitle()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func updateButtonTitle() {
        let title = curated ? "See All" : "See Recommendation"
        refreshButton.setTitle(title, for: .normal)
    }
    
    // MARK: - 버튼이 눌릴 때 마다, View의 Item을 업데이트 함 (snapshot)
    @IBAction func refreshButtonTapped(_ sender: Any) {
        curated.toggle()
        
        self.items = curated ? Focus.recommendations : Focus.list
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
        
        updateButtonTitle()
    }
}

// MARK: - Item을 클릭할 경우, 다른 Storyboard로 넘어감
extension FocusViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = items[indexPath.item] // 특정 Focus list에 있는 Item의 정보를 나타냄
        
        print("didSelectedItem : \(item)")
        
        // MARK: - 타 storyboard에 접근 (이름)
        let storyboard = UIStoryboard(name: "QuickFocus", bundle: nil)
        
        // MARK: - viewController는, storyboard에서 설정한 instantiateViewController(StoryboardID)이며, 이를 강제 타입캐스팅을 통해 타입을 맞춰줌
        let vc = storyboard.instantiateViewController(withIdentifier: "QuickFocusViewController") as! QuickFocusViewController
        
        vc.title = item.title
        
        // MARK: - Modal(present)
//        present(vc, animated: true)
        
        // MARK: - Navigation -> 우측에서 들어오는 형태(Push) -> 상단에 Back 버튼과 Swipe Action이 가능함
        navigationController?.pushViewController(vc, animated: true)
    }
}
