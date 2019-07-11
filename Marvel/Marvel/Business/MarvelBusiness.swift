//
//  MarvelBusiness.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

class MarvelBusiness{
    
    let provider = MarvelProvider()
    
    func list(completion: @escaping APIResultParse){
        provider.list { (result) in
            if result != nil{
                do{
                    let json = JSONDecoder()
                    let marvel = try json.decode(MarvelCharacterRoot.self, from: result!)
                    completion(marvel)
                }catch{
                  completion(nil)
                }
            }else{
                completion(nil)
            }
        }
    }
}
