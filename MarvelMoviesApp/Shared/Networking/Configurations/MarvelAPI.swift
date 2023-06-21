//
//  MarvelAPI.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.

import Foundation
import Moya


enum MarvelAPI {
    case getCharacters(limit: Int, offset:Int)
    case getComicsByID(id:String)
    case searchByName(name:String)
}


extension MarvelAPI: TargetType {
    var baseURL: URL {
        return URL(string:"https://gateway.marvel.com:443/v1/public")!
    }
    
    var path: String {
        switch self {
        case .getCharacters:  return "/characters"
        case .getComicsByID(let id):  return "/characters/\(id)/comics"
        case .searchByName: return "/characters"
        }
    }


    var method: Moya.Method {
        switch self {
        case .getCharacters: return .get
        case .getComicsByID: return .get
        case .searchByName: return .get

        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
            
        case .getCharacters(let limit, let offset):
            let query: [String: Any] = [
                "apikey": Constant.publicKey,
                "ts": Constant.timestamp,
                "hash": Constant.hash,
                "limit": limit,
                "offset":offset
            ]
            
            return .requestParameters(parameters: query, encoding: URLEncoding.default)
            
        case .getComicsByID:
            let query: [String: Any] = [
                "apikey": Constant.publicKey,
                "ts": Constant.timestamp,
                "hash": Constant.hash,
            ]
            
            return .requestParameters(parameters: query, encoding: URLEncoding.default)
            
        case .searchByName(let name):
            let query: [String: Any] = [
                "apikey": Constant.publicKey,
                "ts": Constant.timestamp,
                "hash": Constant.hash,
                "nameStartsWith":name
            ]
            
            return .requestParameters(parameters: query, encoding: URLEncoding.queryString)
     
             }
        }
            
    var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json",
            ]
        }
}
