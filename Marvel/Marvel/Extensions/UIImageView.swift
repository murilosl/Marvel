//
//  UIImageView.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: String) {
        DispatchQueue.global().async { [weak self] in
            if let url_from = URL(string: url) {
                if let data = try? Data(contentsOf: url_from) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
            
        }
    }
}
