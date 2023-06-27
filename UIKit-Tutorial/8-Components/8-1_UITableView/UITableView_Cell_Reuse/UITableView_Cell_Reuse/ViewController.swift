//
//  ViewController.swift
//  UITableView_Cell_Reuse
//
//  Created by Jae hyuk Yim on 2023/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView!
    
    let data = [["content1-1", "content1-2", "content1-3"],
                ["content2-1", "content2-2", "content2-3"],
                ["content3-1", "content3-2", "content3-3"]]
    
    let header = ["Header1", "Header2", "Header1"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawTableView()
        
    }
    
    private func drawTableView() {
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.automaticallyAdjustsScrollIndicatorInsets = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        self.view.backgroundColor = .systemGray6
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        // TableViewCell
        self.tableView.register(UITableViewCell.self,
                                forCellReuseIdentifier: "TableViewCell")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellWithIndexPath = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                              for: indexPath)
        
        cellWithIndexPath.textLabel?.text = data[indexPath.section][indexPath.row]
        return cellWithIndexPath
    }
}

extension ViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    // row(item)이 선택될때 실행되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .gray
    }
    
    // row(item)의 높이값을 설정하는 메서드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
