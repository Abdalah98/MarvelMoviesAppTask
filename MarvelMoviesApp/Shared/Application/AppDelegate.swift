//
//  AppDelegate.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.
//

import UIKit
import CommonCrypto
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    
    var appFlowCoordinator: AppFlowCoordinator?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        
        window?.rootViewController = navigationController
        appFlowCoordinator = AppFlowCoordinator(navigationController: navigationController)
        appFlowCoordinator?.start()
        return true
    }
    
}
