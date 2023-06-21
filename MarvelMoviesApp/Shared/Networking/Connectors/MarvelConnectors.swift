//
//  MarvelConnectors.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.
//

import Foundation
class MarvelConnectors: API_Provider<MarvelAPI> {
    func getCharacters(limit: Int, offset:Int,onSuccess: @escaping (_ getCharacters: CharactersInfo) -> Void,
                      onfailure: @escaping (_ message: String) -> Void) {
        request(modelType: CharactersInfo.self,
                target: .getCharacters(limit: limit, offset:offset)) { (result) in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onfailure(error.errorDescription)
            }
        }
    }
    func searchByName(name:String,onSuccess: @escaping (_ getCharacters: CharactersInfo) -> Void,
                      onfailure: @escaping (_ message: String) -> Void) {
        request(modelType: CharactersInfo.self,
                target: .searchByName(name: name)) { (result) in
            switch result {
            case .success(let model):
                
                onSuccess(model)
            case .failure(let error):
                onfailure(error.errorDescription)
            }
        }
    }
    func getComicsInfo(id:String,onSuccess: @escaping (_ getComicsInfo: ComicsInfo) -> Void,
                      onfailure: @escaping (_ message: String) -> Void) {
        request(modelType: ComicsInfo.self,
                target: .getComicsByID(id: id)) { (result) in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onfailure(error.errorDescription)
            }
        }
    }
}
