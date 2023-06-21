//
//  Constant.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.
//

import Foundation
struct Constant {
    static let publicKey = "0b3cc0de78471c3b31a1489cc5bf7548"
    static let privateKey = "41b82638eda47f3d1e8ce13593d2dea1e7edb433"
    static let timestamp = "\(Date().timeIntervalSince1970)"

    static let hashInput = timestamp + privateKey + publicKey
    static let hash = HashGenerator.MD5(string: hashInput)
}

