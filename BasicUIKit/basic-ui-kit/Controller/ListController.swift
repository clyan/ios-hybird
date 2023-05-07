//
//  ListController.swift
//  basic-ui-kit
//
//  Created by yanwenyao on 2023/5/7.
//

import UIKit

class ListController: UIViewController {

    var dataSource:[String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...99 {
            dataSource.append("\(index)")
        }

        // 告诉tableview事件从哪来
        tableView.delegate = self
        // 告诉tableView从哪获取数据源
        tableView.dataSource = self
        tableView.reloadData()
    }
    
}

extension ListController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = dataSource[indexPath.row]
        print(data)
    }
}
