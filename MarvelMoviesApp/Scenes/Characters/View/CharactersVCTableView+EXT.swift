//
//  CharactersVCTableView+EXT.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 20/06/2023.
//

import UIKit
extension CharactersVC : UITableViewDelegate, UITableViewDataSource{
    
    // MARK: - Table view data source
    func configureTableView() {
        self.tableView.estimatedRowHeight = vm.cellHeight
        self.tableView.rowHeight = UITableView.automaticDimension
        tableViewDesign()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "CharactersTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CharactersTableViewCell")
    }
    
    func tableViewDesign() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfCellNews
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersTableViewCell", for: indexPath) as? CharactersTableViewCell else {
            fatalError("Failed to dequeue CharactersTableViewCell")
        }
        
        let cellVM = vm.getCellViewModel(at: indexPath)
        cell.charactersCellViewModel = cellVM
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == expandedCellIndex {
            // Selected cell is already expanded, collapse it
            expandedCellIndex = -1
        } else {
            // Update the currently expanded cell index to the selected cell's index
            expandedCellIndex = indexPath.row
        }
        
        // Reload the selected row and the previously expanded row (if any)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        if expandedCellIndex != -1 {
            tableView.reloadRows(at: [IndexPath(row: expandedCellIndex, section: 0)], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        if indexPath.row == lastRowIndex {
            vm.loadMoreCharacters()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == expandedCellIndex ? vm.expandedCellHeight : vm.cellHeight
    }
}
