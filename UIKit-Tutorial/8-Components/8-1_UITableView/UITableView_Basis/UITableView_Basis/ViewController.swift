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
        
        drawTableView()
    }
    
    // drawTableView()
    private func drawTableView() {
        tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.automaticallyAdjustsScrollIndicatorInsets = true
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// Data를 할당하는 과정
extension ViewController: UITableViewDataSource {
    
    // row의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 미리 작성해 놓은 data의 배열 in 배열요소(section)의 수
        return data[section].count
    }
    
    // cell 내부에 표현되는 row(item)의 정보
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        
        // Cell에 표현되는 row(item) -> indexing (미리 작성해놓은 data를 가져오는데, 몇번째 section에 몇번째 row 값인지 설정)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
}

// Section을 적용하는 과정
extension ViewController: UITableViewDelegate {
    
    // Section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }
    
    // Section의 Title 정의
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
}

