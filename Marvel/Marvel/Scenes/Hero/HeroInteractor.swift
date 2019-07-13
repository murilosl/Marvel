//
//  HeroInteractor.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 12/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

protocol HeroBusinessLogic
{
  func doSomething(request: Hero.Something.Request)
}

protocol HeroDataStore
{
  //var name: String { get set }
}

class HeroInteractor: HeroBusinessLogic, HeroDataStore
{
  var presenter: HeroPresentationLogic?
  var worker: HeroWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Hero.Something.Request)
  {
    worker = HeroWorker()
    worker?.doSomeWork()
    
    let response = Hero.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
