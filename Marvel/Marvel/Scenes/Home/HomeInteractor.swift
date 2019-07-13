//
//  HomeInteractor.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//


import UIKit

protocol HomeBusinessLogic
{
  func doSomething(request: Home.Something.Request)
    var character: MarvelCharacter? { get set}
}

protocol HomeDataStore
{
  var character: MarvelCharacter? { get  set}
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    var character: MarvelCharacter?
    // MARK: Do something

    func doSomething(request: Home.Something.Request)
    {
        worker = HomeWorker()
        worker?.fetchChars(completion: { (result) in
            let response = Home.Something.Response(characters: result)
            self.presenter?.presentSomething(response: response)
        })
    }

}
