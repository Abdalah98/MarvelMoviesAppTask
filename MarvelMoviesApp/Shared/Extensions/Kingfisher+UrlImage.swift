//
//  Kingfisher + UrlImage.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.


import Foundation
import UIKit

import Kingfisher

extension UIImageView{
    
    func setImage(_ strURL: String){
        guard let handllingURL = (strURL).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{return}
        guard let imageURL = URL(string: handllingURL) else {return}
        
        self.kf.indicatorType = .activity
        self.kf.setImage(with: imageURL
                         , placeholder: UIImage(named: "no_image_placeholder"))
    }
}

