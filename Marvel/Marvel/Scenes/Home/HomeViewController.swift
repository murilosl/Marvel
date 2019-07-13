//
//  HomeViewController.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 11/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class
{
  func displaySomething(viewModel: Home.Something.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
  var interactor: HomeBusinessLogic?
  var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

    @IBOutlet weak var collectionView: UICollectionView!
    var characters: [MarvelCharacter] = []
    
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
        if scene=="show"{
            let heroViewController = segue.destination as! HeroViewController
            let itemSelected = collectionView.indexPathsForSelectedItems?.first?.row
            heroViewController.hero = characters[itemSelected!]
        }
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Home.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Home.Something.ViewModel)
  {
    characters = viewModel.characters
    collectionView.reloadData()
  }
}

extension HomeViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellMarvel", for: indexPath) as! MarvelHomeCollectionViewCell
        
        let character = characters[indexPath.row]
        cell.populate(character: character)
        
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegate{
    
}

