//
//  BaseUseCase.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 18/06/2023.
//

import Foundation

protocol GetCharactersUseCase {
    func getCharacters(onSuccess: @escaping(_ results: [ResultsCharacters]) -> Void,
                       onFailure: @escaping(_ message: String) -> Void)
}

final class GetCharactersUseCaseImplementation: GetCharactersUseCase {
    
    private let service: MarvelConnectors
    private let fetchLimitCharacters = 15
    private let offset = 0

    init(service: MarvelConnectors = .init()
    ) {
        self.service = service
    }
    
    func getCharacters(onSuccess: @escaping ([ResultsCharacters]) -> Void,
                       onFailure: @escaping (String) -> Void) {
        service.getCharacters(limit: fetchLimitCharacters, offset: offset) { charactersInfo in
            guard let charachters = charactersInfo.data?.results else {
                onFailure("Failed")
                return
            }
            onSuccess(charachters)
        } onfailure: { message in
           onFailure(message)
        }
    }
}

/* Example Usage
 
final class CharactersViewModel {
    private let getCharactersUseCase: GetCharactersUseCase
    
    init(getCharactersUseCase: GetCharactersUseCase = GetCharactersUseCaseImplementation()
    ) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func fetchCharacters(completion: @escaping ([ResultsCharacters]?, Error?) -> Void) {
        getCharactersUseCase.getCharacters { results in
            
        } onFailure: { message in
            
        }
    }
}
 
 */
