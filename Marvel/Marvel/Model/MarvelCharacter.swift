//
//  MarvelCharacter.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

struct MarvelCharacter: Codable {
    let id: Int
    let name: String
    let thumbnail: thumbnail
    let description: String
}

struct thumbnail: Codable{
    let path: String
    let ext: String
    
    var url: String {
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}



struct MarvelCharacterRoot: Codable{
    let data: MarvelCharacterResult
}

struct MarvelCharacterResult: Codable {
    let results: [MarvelCharacter]
}
