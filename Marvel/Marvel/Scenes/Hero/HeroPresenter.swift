//
//  HeroPresenter.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 12/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

protocol HeroPresentationLogic
{
  func presentSomething(response: Hero.Something.Response)
}

class HeroPresenter: HeroPresentationLogic
{
  weak var viewController: HeroDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Hero.Something.Response)
  {
    let viewModel = Hero.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
