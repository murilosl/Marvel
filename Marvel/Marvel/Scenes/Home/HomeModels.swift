//
//  HomeModels.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

enum Home
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
        let characters: [MarvelCharacter]
    }
    struct ViewModel
    {
        let characters: [MarvelCharacter]
    }
  }
}
