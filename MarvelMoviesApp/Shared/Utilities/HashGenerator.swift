//
//  HashGenerator.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.
//

import Foundation
import CryptoKit
class HashGenerator {
    static func MD5(string: String) -> String {
        let hash = Insecure.MD5.hash(data:string.data(using: .utf8) ?? Data())
        return hash.map{
            String(format: "%02hhx", $0)
        }
        .joined()
 }
}
