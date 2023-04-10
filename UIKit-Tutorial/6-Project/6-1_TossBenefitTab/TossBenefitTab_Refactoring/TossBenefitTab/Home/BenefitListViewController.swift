//
//  BenefitListViewController.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/07.
//

import UIKit
import Combine

class BenefitListViewController: UIViewController {
    
    // Item
    typealias Item = AnyHashable
    
    // Section
    enum Section: Int {
        case today
        case other
    }
    
    // Data
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // Data in Section (Items)
    // MARK: - 네트워크를 통해 아이템이 전송되면, 뒤늦게 발생할 수 있음(ViewDidLoad 시점에 데이터가 없을 수 있으니) -> 따라서, 일종의 비동기화가 필요함
    // 따라서, 1차적으로 빈 Array로서 선언한 후 -> Async를 통해 데이터를 받아올 수 있도록 함 // 77번째 줄
    // 또한, 퍼블리셔(Published)로의 선언 또한 필요함! (데이터 값이 바뀌기 때문)
//    @Published var todaySectionItem: [AnyHashable] = []
//    @Published var otherSectionItem: [AnyHashable] = []
    
    
    // subscription
    var subscriptions = Set<AnyCancellable>()
    
    // ViewModel 가져오기
    let viewModel: BenefitListViewModel = BenefitListViewModel()
    
    // collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    // viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureCollecetionView()
        bind()
        
        viewModel.fetchItems() // 기존에 snapshot 데이터를 넣어줌
    }
    
    private func bind() {
        // outoput: data
        viewModel.$todaySectionItems
            .receive(on: RunLoop.main) // 어디서 실행?
            .sink { items in // 무슨 데이터를 넣어줘?
                self.applySnapshot(item: items, section: .today)
            }.store(in: &subscriptions) // 구독은 누가하나?
        
        viewModel.$otherSectionItems
            .receive(on: RunLoop.main) // 어디서 실행?
            .sink { items in // 무슨 데이터를 넣어줘?
                self.applySnapshot(item: items, section: .other)
            }.store(in: &subscriptions) // 구독은 누가하나?
        
        // input: user interections
        viewModel.benefitDidTapped
            .receive(on: RunLoop.main)
            .sink { benefit in // 무슨 데이터를 넣어줘?
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                
                // 넘기는 모델값 세팅
                vc.detailViewModel = DetailViewModel(benefit: benefit)
                self.navigationController?.pushViewController(vc, animated: true)

            }.store(in: &subscriptions)
        
        viewModel.pointDidTapped
            .receive(on: RunLoop.main)
            .sink { point in
                let sb = UIStoryboard(name: "MyPoint", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "MyPointViewController") as! MyPointViewController
                
                // 넘기는 모델값 세팅
                vc.myPointViewModel = MyPointViewModel(points: point)
                self.navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscriptions)
    }
    
    // dataSource에 데이터할당하기 위한 ApplySnapshot
    private func applySnapshot(item: [Item], section: Section) {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(item, toSection: section)
        dataSource.apply(snapshot)
    }
    
    private func configureCollecetionView() {
        // delegate
        collectionView.delegate = self
        
        // presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            // section initalizer
            guard let section = Section(rawValue: indexPath.section) else { return nil }
            
            // cell information (Each Section)
            let cell = self.configureCell(
                for: section,
                item: item,
                collectionView: collectionView,
                indextPath: indexPath)

            return cell
        })
        
        // Data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.today, .other])
        
        // Append Each Section Items
        snapshot.appendItems([], toSection: .today)
        snapshot.appendItems([], toSection: .other)
        dataSource.apply(snapshot)
        
        
        // Layout
        collectionView.collectionViewLayout = layout()
    }
    
    private func setupUI() {
        navigationItem.title = "혜택"
    }
    
    // presentation
    private func configureCell(for section: Section, item: Item, collectionView: UICollectionView, indextPath: IndexPath) -> UICollectionViewCell? {
        
        switch section {
        case .today :
            if let point = item as? MyPoint {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPointCell", for: indextPath) as! MyPointCell
                cell.configure(item: point)
                return cell
            } else if let benefit = item as? Benefit {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayBenefitCell", for: indextPath) as! TodayBenefitCell
                cell.configure(item: benefit)
                return cell
            } else {
                return nil
            }
            
        case .other :
            if let benefit = item as? Benefit {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BenefitCell", for: indextPath) as! BenefitCell
                cell.configure(item: benefit)
                return cell
            } else {
                return nil
            }
        }
    }
    
    // layout()
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let spacing: CGFloat = 10
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        group.interItemSpacing = .fixed(spacing) // 그룹간의 Spacing
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = spacing // 내부 그룹간의 spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16) 
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
}

// Action (Item Selected)
extension BenefitListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // item -> indexPath (dataSource)
        let item = dataSource.itemIdentifier(for: indexPath)
        print("didSelected Item: \(item)")
        
        // Each Model(data) -> Different Type (Benefit, MyPoint)
        // 네비게이션 뷰를 활용하기 위해
        if let benefit = item as? Benefit {
            // Combine -> 데이터를 보내줘야지(Send)
            viewModel.benefitDidTapped.send(benefit)
        } else if let point = item as? MyPoint {
            viewModel.pointDidTapped.send(point)
        } else {
            // no-op
        }
    }
}
