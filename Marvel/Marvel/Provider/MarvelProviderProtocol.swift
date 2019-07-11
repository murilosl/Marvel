//
//  MarvelProviderProtocol.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 10/07/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

protocol MarvelProviderProtocol {
    func list(completion: @escaping APIResultCall)
    func byId(completion: @escaping APIResultCall)
    func getImageFromUrl(url: URL, completion: @escaping APIResultImage)
}
