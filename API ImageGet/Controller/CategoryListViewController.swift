//
//  CategoryListViewController.swift
//  API ImageGet
//
//  Created by daffolapmac146 on 09/06/20.
//  Copyright © 2020 daffolapmac146. All rights reserved.
//

import UIKit

class CategoryListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrData = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.getData()
    }
}

//MARK: Table View Delegates
extension CategoryListViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell
        cell.detailArray = arrData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
        
    }
}

extension CategoryListViewController: APIManagerDelegate {
    func didReceive(data: [DataModel]) {
        self.arrData = data
        self.tableView.reloadData()
    }
    
    
}
