//
//  CategoryListViewController.swift
//  API ImageGet
//
//  Created by daffolapmac146 on 04/06/20.
//  Copyright © 2020 daffolapmac146. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var arrName = [Result]()
    var arrData = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.sharedInstance.getData()
        //getData()
    }
 
// MARK: Get Name from URL
//    func getData() {
//        let url = URL(string: "http://hopedev.cloudzmall.com:8000/public/categories")
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            do {
//                if error == nil {
//                    let data = try JSONDecoder().decode(Welcome.self, from: data!)
//                    self.arrName = data.result
//                    for info in self.arrName {
//                        self.getImage(url: info.imageURL, name: info.name)
//                    }
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
    
//MARK: Get Image from URL
//    func getImage(url:String,name: String) {
//        let URLString = "https://marketplacespprtsme.s3.us-east-2.amazonaws.com"
//        guard let imageURL = URL(string: "\(URLString)/\(url)") else { return }
//
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: imageURL) else { return }
//            let img: UIImage? = UIImage(data: imageData)
//
//            DispatchQueue.main.async {
//                let showData = DataModel(image: img!, name: name)
//                self.arrData.append(showData)
//                self.tableView.reloadData()
//            }
//        }
//    }
}

//MARK: Table View Delegates
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
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


