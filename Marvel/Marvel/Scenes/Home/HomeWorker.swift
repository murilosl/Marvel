//
//  HomeWorker.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

class HomeWorker
{
    let manager = MarvelManager()
    func doSomeWork()
    {
    }

    func fetchChars(completion: @escaping([MarvelCharacter]) -> Void){
        manager.list(completion: { (result) in
            if result != nil{
                completion(result)
            }else{
            }
        })
    }

}
