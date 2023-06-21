
//  Helper+Ext.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.



import Foundation
import UIKit
import SafariServices
extension  UIViewController {
    
    // AlertController An action that can be show message  in an alert.
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // pass url in func goSafari to open url in Safari
    func goSafari(urlString: String){
        guard let url = URL(string:urlString ) else {return}
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemBlue
        self.present(safariVC, animated: true)
    }
    
    func showActivityIndicator() {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        
        view.addSubview(activityIndicatorView)
        view.isUserInteractionEnabled = false
    }
    
    func hideActivityIndicator() {
        if let activityIndicatorView = view.subviews.first(where: { $0 is UIActivityIndicatorView }) as? UIActivityIndicatorView {
            activityIndicatorView.removeFromSuperview()
            view.isUserInteractionEnabled = true
        }
    }
}


