//
//  APIRequest.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 10/07/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation
import Alamofire
import CryptoSwift

class APIRequest{

    //MARK: - Generic Request
    
    func open(url: String, completion: @escaping APIResultCall){
        
        let ts = NSDate().timeIntervalSince1970.description
        let apikey = APIConstants.api_key
        let privatekey = APIConstants.private_key
        let hash = "\(ts)\(privatekey)\(apikey)".md5()
        
        let headers: HTTPHeaders = [
            "ts": ts,
            "apikey": apikey,
            "hash": hash
        ]
        
        let urlRequest = url + "?ts=\(ts)&hash=\(hash)&apikey=\(apikey)"

        Alamofire.request(urlRequest, headers: headers).responseData{ (result) in
            if let dataReturn = result.value{
               completion(dataReturn)
            }else{
                completion(nil)
            }
        }
    }
    
    //MARK: - Download Image
    
    func getImageFromUrl(url: URL, completion: @escaping APIResultImage) {
        
        Alamofire.request(url).responseData { (result) in
            if let dataReturn = result.value{
                completion(dataReturn)
            }else{
                completion(nil)
            }
        }
    }
}
