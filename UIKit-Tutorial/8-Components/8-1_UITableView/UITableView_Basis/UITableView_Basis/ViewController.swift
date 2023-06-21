//
//  ViewController.swift
//  UITableView_Basis
//
//  Created by Jae hyuk Yim on 2023/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView!
    
    let data = [["content1-1", "content1-2", "content1-3", "content1-4"],
                ["content2-1", "content2-2", "content2-3", "content2-4"],
                ["content3-1", "content3-2", "content3-3", "content3-4"]]
    
    let header = ["Section1", "Section2", "Section3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray5
            self.view.addSubview(self.tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])

    }
}


