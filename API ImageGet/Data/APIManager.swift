//
//  APIManager.swift
//  API ImageGet
//
//  Created by daffolapmac146 on 09/06/20.
//  Copyright © 2020 daffolapmac146. All rights reserved.
//

import Foundation
import UIKit

protocol APIManagerDelegate: AnyObject {
    func didReceive(data: [DataModel])
}

class APIManager {
    
    static var sharedInstance = APIManager()
    
    var arrName = [Result]()
    var arrData = [DataModel]()
    
    weak var delegate: APIManagerDelegate?
    
    func getData() {
        let url = URL(string: UrlStrings.dataEndPoints)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if error == nil {
                    let data = try JSONDecoder().decode(Welcome.self, from: data!)
                    self.arrName = data.result
                    for info in self.arrName {
                        self.getImage(url: info.imageURL, name: info.name)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func getImage(url:String,name: String) {
        let URLString = UrlStrings.imageEndPoints
        guard let imageURL = URL(string: "\(URLString)/\(url)") else { return }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let img: UIImage? = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                let showData = DataModel(image: img!, name: name)
                self.arrData.append(showData)
                self.delegate?.didReceive(data: self.arrData)
            }
        }
    }
}
