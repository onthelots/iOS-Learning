//
//  HomeViewViewController.swift
//  InstaSearchView
//
//  Created by Jae hyuk Yim on 2023/03/21.
//

import UIKit

class HomeViewViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension HomeViewViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCell", for: indexPath) as? HomeViewCell else {
            return UICollectionViewCell()
        }
        
        let animalsImage = "animal\(indexPath.item + 1)"
        cell.configure(animalsImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
}

extension HomeViewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
