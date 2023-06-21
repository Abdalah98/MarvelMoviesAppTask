//
//  CharactersVCSearchBar+EXT .swift
//  MarvelMoviesApp
//
//  Created by Bedo on 20/06/2023.
//

import UIKit
extension CharactersVC: UISearchBarDelegate {
    
    func configureSearch() {
        searchController.searchBar.placeholder = "Search Here by name Character"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTimer?.invalidate() // Cancel previous timer if exists
        
        if searchText.isEmpty {
            vm.cancelSearch()
        } else {
            vm.isSearching = true
            vm.searchText = searchText
            // Start timer to perform search after a delay
            searchTimer = Timer.scheduledTimer(timeInterval: searchDelay, target: self, selector: #selector(performSearch), userInfo: nil, repeats: false)
        }
    }
        
    @objc func performSearch() {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        vm.searchByName(name: searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        vm.cancelSearch()
    }
}
