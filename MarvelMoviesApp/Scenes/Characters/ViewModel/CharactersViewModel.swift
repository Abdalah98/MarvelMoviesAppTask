////
////  CharactersViewModel.swift
////  MarvelMoviesApp
////
////  Created by Bedo on 17/06/2023.
////
//
import Foundation
//

final class CharactersViewModel {

    //MARK: - Properties

    let marvelConnectors  : MarvelConnectors
    var selectedRequest: ResultsCharacters?
    var resultsArray = [ResultsCharacters]()
    var resultsSearchArray = [ResultsCharacters]()
    var fetchLimitCharacters = 15
    var isSearching = false
    var isLoadingMore = false
    var searchText: String = ""
    var offset = 0 // Store the offset as a property

    
    var cellHeight: CGFloat {
            return 150.0
    }
    
    var expandedCellHeight: CGFloat {
            return 300.0
    }


    // callback for interfaces
    var showAlertClouser:(()->())?
    var updateLoadingStatus : (()->())?
    var reloadTableViewClouser :(()->())?


    // MARK: - Initialization


    init(marvelConnectors: MarvelConnectors) {
        self.marvelConnectors = marvelConnectors
        getCharacters()
    }


    // MARK: - State Handling

    var state: State = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    var alertMessage: String? {
        didSet{
            self.showAlertClouser?()
        }
    }

  
    // MARK: - Cell View Models
    // call each cell and return data by indexPath item
    
    var numberOfCellNews :Int {
        return cellViewModel.count
    }
    
    
    func getCellViewModel(at indexPath : IndexPath) -> CharactersCellViewModel{
        return cellViewModel[indexPath.item]
    }

    private var cellViewModel : [CharactersCellViewModel] = [CharactersCellViewModel](){
        didSet{
            self.reloadTableViewClouser?()
        }
    }

    
    //  i fetch data and i put data  in HeadLineNewsCellViewModel
    func createCellViewModel( resultsCharacters: ResultsCharacters ) -> CharactersCellViewModel {
        let  name           = resultsCharacters.name
        let  date           = resultsCharacters.modified
        let  image          = resultsCharacters.thumbnail?.getPic()
        let  description    = resultsCharacters.description
        let  id             = resultsCharacters.id
        let  copyRight      = "© 2023 MARVEL"
        let  seriesCount    = resultsCharacters.series?.available ?? 0
        let  storiesCount   = resultsCharacters.series?.available ?? 0
        let  comicsCount    = resultsCharacters.comics?.available ?? 0

        return CharactersCellViewModel(
            modified: date ?? "",
            description: description ?? "",
            name: name ?? "" , id: id ?? 0 ,
            image: image ?? "",
            copyRight: copyRight,
            seriesCount:String(seriesCount) ,
            storiesCount:String(storiesCount),
            comicsCount:String(comicsCount))
    }

    // fetch all Results Characters for loop it  and append data in createCellViewModel
    private func processFetchedRequest( results: [ResultsCharacters] ) {
        self.resultsArray = results // Cache
        var vms = [CharactersCellViewModel]()
        for order in resultsArray {
            vms.append( createCellViewModel(resultsCharacters: order) )
        }
        self.cellViewModel = vms
    }

    private func processFetchedSearchRequest( results: [ResultsCharacters] ) {
        self.resultsArray = results // Cache
        var vms = [CharactersCellViewModel]()
        for order in resultsArray {
            vms.append( createCellViewModel(resultsCharacters: order) )

        }
        self.cellViewModel = vms
    }

    // MARK: - Data Provider Methods

    func getCharacters(){
        if !isLoadingMore {
            state = .loading
        }

        marvelConnectors.getCharacters(limit: fetchLimitCharacters, offset: offset) { [weak self] getCharacters in
            guard let self = self else { return }

            let newResults = getCharacters.data?.results ?? []
            if self.isLoadingMore {
                self.resultsArray.append(contentsOf: newResults)
                self.isLoadingMore = false
            } else {
                self.resultsArray = newResults
            }

            if !self.isSearching {
                self.processFetchedRequest(results: self.resultsArray)
                self.state = .populated
            }
        } onfailure: { [weak self] message in
            guard let self = self else { return }
            self.state = .error
            self.alertMessage = message
        }
    }

    func loadMoreCharacters() {
        isLoadingMore = true
        offset = resultsArray.count // Update the offset for the next batch of characters
        getCharacters()
    }


    func searchByName(name: String) {
        state = .loading
        marvelConnectors.searchByName(name: name) { [weak self] getCharacters in
            guard let self = self else { return }
            self.resultsSearchArray = getCharacters.data?.results ?? []

            if self.isSearching {
                self.processFetchedSearchRequest(results: self.resultsSearchArray)
                self.state = .populated
            }
        } onfailure: { [weak self] message in
            guard let self = self else { return }
            self.state = .error
            self.alertMessage = message
        }
    }

    // return when i selectedArticle cell get cell indexPath Item
    func userPressed( at indexPath: IndexPath ){
        let request = self.resultsArray[indexPath.row]
        self.selectedRequest = request
    }

    func cancelSearch() {
        isSearching = false
        searchText = ""

        if searchText.isEmpty {
            getCharacters()
        } else {
            processFetchedRequest(results: resultsArray)
            state = .populated
        }
    }
}
