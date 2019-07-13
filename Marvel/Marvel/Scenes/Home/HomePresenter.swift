//
//  HomePresenter.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

protocol HomePresentationLogic
{
  func presentSomething(response: Home.Something.Response)
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Home.Something.Response)
  {
    let viewModel = Home.Something.ViewModel(characters: response.characters)
    viewController?.displaySomething(viewModel: viewModel)
  }
}
