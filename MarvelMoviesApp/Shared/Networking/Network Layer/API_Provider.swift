//
//  CharactersInfo.swift
//
//  Created by Bedo on 16/06/2023.
//

import Foundation
import Moya

struct NetworkError {
    // TODO: Localize
    static let genericError = "Oops, something went wrong.\nPlease, try again later."
    var errorDescription: String
    var statusCode: Int
}

enum Result<T> where T: Codable {
    case success(T)
    case failure(NetworkError)
}

class API_Provider<T> where T: TargetType {
    
    let provider = MoyaProvider<T>()
    
    func request<M: Codable>(modelType: M.Type, target: T,
                             completion: @escaping (Result<M>) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                if let url = response.request?.url {
                            print(url.debugDescription)
                        }
                if let filteredResponse = try? response.filter(statusCodes: 200...299) {
                    do {
                        let decoder = JSONDecoder()
                        let mappedResponse = try decoder.decode(M.self, from: filteredResponse.data)
                        completion(.success(mappedResponse))
                    } catch let error {
                        debugPrint(error.localizedDescription)
                        debugPrint("Parse error : \n\(error)")
                        let message = NetworkError.genericError
                        let code = response.statusCode
                        let failureError = NetworkError(errorDescription: message, statusCode: code)
                        completion(.failure(failureError))
                    }
                } else { //API Error
                    if response.statusCode == 401 { //Unauthorized
                        print("Status Code : \(String(describing: response.response?.statusCode))")

                    } else {
                        let errorModel = try? response.map(ErrorModel.self)
                        let message = errorModel?.message ?? NetworkError.genericError
                        let code = response.statusCode
                        let failureError = NetworkError(errorDescription: message, statusCode: code)
                        completion(.failure(failureError))
                    }
                }
            case .failure(let error): //Network Error
                let message = error.failureReason ?? NetworkError.genericError
                let code = error.response?.statusCode ?? 500
                let failureError = NetworkError(errorDescription: message, statusCode: code)
                completion(.failure(failureError))
            }
        }
    }
}
