//
//  ComicsExpandCollectionViewCell.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 17/06/2023.
//

import UIKit

class ComicsExpandCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var nameComicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(_ results:Results){
        comicImage.setImage(results.thumbnail?.getPic() ?? "")
        guard let title = results.title else{return}
        nameComicLabel.text = title

    }
}
