//
//  OnboardingVC.swift
//  todoor
//
//  Created by Bedo on 16/06/2023.
//

import Foundation
import UIKit

final class AppFlowCoordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = CharactersVC()
     
        navigationController.pushViewController(vc, animated: true)
    }


}
