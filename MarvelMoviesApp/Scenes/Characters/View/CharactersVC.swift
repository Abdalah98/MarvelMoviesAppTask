//
//  CharactersVC.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.
//

import UIKit
import Kingfisher

final class CharactersVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak  var tableView: UITableView!
    
    //MARK: - Properties
    let searchController = UISearchController()
    var searchDelay: TimeInterval = 0.5
    var searchTimer: Timer?
    var isFetchingMore = false
    var expandedCellIndex = -1
    let activityIndicatorView = UIActivityIndicatorView(style: .medium)
     var vm: CharactersViewModel!

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
}

// MARK: - Setup
private extension CharactersVC {
    
    func initViews() {
        title = "Characters"
        let marvelConnectors = MarvelConnectors() // Create an instance of MarvelConnectors
            vm = CharactersViewModel(marvelConnectors: marvelConnectors)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        configureSearch()
        configureTableView()
        showAlert()
        updateLoadingStatus()
        reloadTableView()
    }

    
    func showAlert() {
        vm.showAlertClouser = {[weak self] in ()
            DispatchQueue.main.async {
                if let message = self?.vm.alertMessage  {
                    self?.showAlert(message)
                }
            }
        }
    }
    
    // updateLoadingStatus: when call data i show loading Activity when i fetch all data  it hidden or when something error it hide and show it data downloading
    // animate when collection show it
    func  updateLoadingStatus() {
        vm.updateLoadingStatus = { [weak self] () in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                UIView.animate(withDuration: 0.2, animations: {
                    switch self.vm.state {
                    case .empty, .error:
                        self.hideActivityIndicator()
                        self.tableView.alpha = 0.0
                        
                    case .loading:
                        self.showActivityIndicator()
                        self.tableView.alpha = 0.0
                        
                    case .populated:
                        self.hideActivityIndicator()
                        self.tableView.alpha = 1.0
                    }
                })
            }
        }
    }
    
    // reloadTableViewClouser:  reload data when it comes to show in reloadTableViewClouser and fetch data
    func reloadTableView() {
        vm.reloadTableViewClouser = {[weak self] in ()
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
