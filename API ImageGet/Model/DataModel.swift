//
//  DataModel.swift
//  API ImageGet
//
//  Created by daffolapmac146 on 04/06/20.
//  Copyright © 2020 daffolapmac146. All rights reserved.
//

import Foundation
import UIKit

struct Welcome: Codable {
    let result: [Result]
    let status: String
}

// MARK: - Result
struct Result: Codable {
    let id, name, imageURL, createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case imageURL = "imageUrl"
        case createdAt, updatedAt
    }
}

struct DataModel {
    var image: UIImage
    var name: String
}

