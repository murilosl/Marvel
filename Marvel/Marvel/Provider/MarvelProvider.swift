//
//  MarvelProvider.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 10/07/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

class MarvelProvider: MarvelProviderProtocol{
    
    let request = APIRequest()
    
    func list(completion: @escaping APIResultCall) {
        
        let url = APIConstants.base_url
        
        request.open(url: url) { (result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }
        
    }
    
    func byId(completion: @escaping APIResultCall) {
        
    }
    
    func getImageFromUrl(url: URL, completion: @escaping APIResultImage) {
        
    }
    
    
}
