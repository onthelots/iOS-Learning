//
//  ViewController.swift
//  Social_Media_With_Table_View
//
//  Created by Jae hyuk Yim on 2023/06/14.
//


import UIKit

class ViewController: UIViewController {
    let feeds: [Feed] = Feed.feeds
    
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuareNavigationBar()
        addTable()
        configureTable()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("NeededUpdateLayout"),
                                               object: nil,
                                               queue: nil) { [self] (notification) in
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    // Add TableView
    private func addTable() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.automaticallyAdjustsScrollIndicatorInsets = true
        self.view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    // configureTable
    private func configureTable() {
        tableView.rowHeight = UITableView.automaticDimension // auto height
        tableView.estimatedRowHeight = UITableView.automaticDimension // auto height
        tableView.register(FeedTableViewCell.self,
                           forCellReuseIdentifier: "FeedTableViewCell") // subCell 등록
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
    }
    
    
    // NavigationBar
    private func configuareNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.tintColor = .white
        
        let searchBar: UISearchBar = UISearchBar()
        searchBar.placeholder = "검색"
        searchBar.searchTextField.backgroundColor = .white
        
        // searchBar를 navigation의 titleView로 설정
        navigationItem.titleView = searchBar
        
        let cameraButton = UIBarButtonItem(systemItem: .camera)
        let shareButton = UIBarButtonItem(systemItem: .action)
        
        navigationItem.leftBarButtonItem = cameraButton
        navigationItem.rightBarButtonItem = shareButton
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as?
                FeedTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath)
        }
        cell.feed = Feed.feeds[Int.random(in: 0...9)]
        return cell
    }
}
