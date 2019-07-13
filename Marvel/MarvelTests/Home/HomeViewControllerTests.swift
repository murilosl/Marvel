//
//  HomeViewControllerTests.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 12/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

@testable import Marvel
import XCTest

class HomeViewControllerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: HomeViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupHomeViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupHomeViewController()
  {
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
    sut = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
  class HomeBusinessLogicSpy: HomeBusinessLogic
  {
    var character: MarvelCharacter?
    
    var doSomethingCalled = false
    
    func doSomething(request: Home.Something.Request)
    {
      doSomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testShouldDoSomethingWhenViewIsLoaded()
  {
    // Given
    let spy = HomeBusinessLogicSpy()
    sut.interactor = spy
    
    // When
    loadView()
    
    // Then
    XCTAssertTrue(spy.doSomethingCalled, "viewDidLoad() should ask the interactor to do something")
  }
  
  func testDisplaySomething()
  {
    // Given
    //let viewModel = Home.Something.ViewModel()
    
    // When
    loadView()
    //sut.displaySomething(viewModel: viewModel)
    
    // Then
    //XCTAssertEqual(sut.nameTextField.text, "", "displaySomething(viewModel:) should update the name text field")
  }
}
