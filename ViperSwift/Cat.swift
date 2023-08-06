//
//  Cat.swift
//  ViperSwift
//
//  Created by AHMET HAKAN YILDIRIM on 6.08.2023.
//

import Foundation

// MARK: - Cat
struct Cat: Codable {
    let description: String
    let imageURL: String
    let statusCode: Int

    enum CodingKeys: String, CodingKey {
        case description
        case imageURL = "imageUrl"
        case statusCode
    }
}
