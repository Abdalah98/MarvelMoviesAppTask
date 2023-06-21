//
//  CharactersTableViewCell.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameCharactersLabel: UILabel!
    @IBOutlet weak var discrptionCharactersLabel: UILabel!
    @IBOutlet weak var modifiedCharactersLabel: UILabel!
    @IBOutlet weak var copyRightLabel: UILabel!
    
    @IBOutlet weak var seriesCharactersLabel: UILabel!
    @IBOutlet weak var storiesCharactersLabel: UILabel!
    @IBOutlet weak var comicsCharactersLabel: UILabel!
    
    @IBOutlet weak var bottomView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var charactersCellViewModel: CharactersCellViewModel?{
        didSet{
            seriesCharactersLabel.text = "\(charactersCellViewModel?.seriesCount ?? "") Series"
            storiesCharactersLabel.text = "\(charactersCellViewModel?.storiesCount ?? "") Stories"
            comicsCharactersLabel.text = "\(charactersCellViewModel?.comicsCount ?? "") Comics"
            copyRightLabel.text = charactersCellViewModel?.copyRight
            
            characterImage.setImage(charactersCellViewModel?.image ?? "")
            
            nameCharactersLabel.text = charactersCellViewModel?.name
            discrptionCharactersLabel.text = charactersCellViewModel?.description
            
            if let modifiedDateString = charactersCellViewModel?.modified {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                if let modifiedDate = dateFormatter.date(from: modifiedDateString) {
                    dateFormatter.dateFormat = "MMMM d, yyyy"
                    let convertedDateString = dateFormatter.string(from: modifiedDate)
                    modifiedCharactersLabel.text = convertedDateString
                } else {
                    print("Invalid date format")
                    modifiedCharactersLabel.text = ""
                }
            } else {
                modifiedCharactersLabel.text = ""
            }
        }
    }
}
