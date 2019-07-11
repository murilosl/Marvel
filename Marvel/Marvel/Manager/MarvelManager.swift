//
//  MarvelManager.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

class MarvelManager{
    let business = MarvelBusiness()
    
    func list(completion: @escaping APIResultParse){
        business.list { (result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }
    }
}
