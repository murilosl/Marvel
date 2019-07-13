//
//  MarvelHomeTableViewCell.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

class MarvelHomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    func populate(character: MarvelCharacter){
        self.name.text = character.name
        self.image.load(url: character.thumbnail.url)
    }

}
