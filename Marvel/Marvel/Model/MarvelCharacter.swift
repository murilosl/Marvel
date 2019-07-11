//
//  MarvelCharacter.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

struct MarvelCharacter: Codable {
    let name: String
    let thumbnail: [thumbnail]
}

struct thumbnail: Codable{
    let path: String
}

struct MarvelCharacterRoot: Codable{
    let results: [MarvelCharacter]
}
