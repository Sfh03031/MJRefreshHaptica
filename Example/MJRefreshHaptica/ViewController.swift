//
//  ViewController.swift
//  MJRefreshHaptica
//
//  Created by Sfh03031 on 05/13/2025.
//  Copyright (c) 2025 Sfh03031. All rights reserved.
//

import UIKit
import MJRefresh

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
    }

    @objc func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.mj_header?.endRefreshing()
        }
    }
    
    lazy var tableView: UITableView = {
        let tabView = UITableView(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height - 100), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refresh))
        header.loadingView?.color = .orange
        header.arrowView?.tintColor = .orange
        header.stateLabel?.textColor = .orange
        header.lastUpdatedTimeLabel?.textColor = .orange
        
        tabView.mj_header = header
        if #available(iOS 15.0, *) {
            tabView.sectionHeaderTopPadding = 0
        }
        
        return tabView
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier:String = NSStringFromClass(UITableViewCell.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.accessoryType = .disclosureIndicator
        
        cell?.textLabel?.text = "\(indexPath.row)"
        
        return cell!
    }
    
}
