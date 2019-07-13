//
//  HeroViewController.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 12/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

protocol HeroDisplayLogic: class
{
  func displaySomething(viewModel: Hero.Something.ViewModel)
}

class HeroViewController: UIViewController, HeroDisplayLogic
{
  var interactor: HeroBusinessLogic?
  var router: (NSObjectProtocol & HeroRoutingLogic & HeroDataPassing)?
    var hero: MarvelCharacter?
  // MARK: Object lifecycle
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
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
    let interactor = HeroInteractor()
    let presenter = HeroPresenter()
    let router = HeroRouter()
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
        setupHero()
    }
  
    // MARK: Do something
  
    //@IBOutlet weak var nameTextField: UITextField!
  
    func doSomething()
    {
        let request = Hero.Something.Request()
        interactor?.doSomething(request: request)
    }

    func setupHero(){
        image.load(url: (hero?.thumbnail.url)!)
        name.text = hero?.name
        desc.text = hero?.description
    }

    func displaySomething(viewModel: Hero.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}
