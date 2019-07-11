//
//  ViewController.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 10/07/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = MarvelManager()
        manager.list { (result) in
            DispatchQueue.main.async {
                print(result)
            }
            
        }
    }


}

