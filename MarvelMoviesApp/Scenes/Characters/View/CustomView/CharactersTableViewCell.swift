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
    

    @IBOutlet weak var collctionView: UICollectionView!
    
    var results = [Results](){
        didSet{
            collctionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureDataCollection()
    }
    
    var charactersCellViewModel: CharactersCellViewModel?{
        didSet{
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
    
    
    func configureDataCollection(){
        collctionView.delegate = self
        collctionView.dataSource = self
      
      // Layout
      let layout = collctionView.collectionViewLayout as? UICollectionViewFlowLayout
             layout?.sectionInset = UIEdgeInsets(top: 16, left: 0 , bottom: 0, right: 6 )
      
      let nibImage = UINib(nibName: "ComicsExpandCollectionViewCell", bundle: nil)
        collctionView.register(nibImage, forCellWithReuseIdentifier: "ComicsExpandCollectionViewCell")
    }
}

// MARK: - UiCollectionView
extension CharactersTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

 
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

      return results.count
  }
  //DataCollectionViewCell
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicsExpandCollectionViewCell", for: indexPath) as? ComicsExpandCollectionViewCell else{
        fatalError("Not found cell identifier")
      }
      let dataComic = results[indexPath.item]
      cell.set(dataComic)
    return cell
  }
 

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: 125   , height:  230 )
  
  }
 
}
