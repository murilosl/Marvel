//
//  HeroPresenterTests.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 12/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

@testable import Marvel
import XCTest

class HeroPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: HeroPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupHeroPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupHeroPresenter()
  {
    sut = HeroPresenter()
  }
  
  // MARK: Test doubles
  
  class HeroDisplayLogicSpy: HeroDisplayLogic
  {
    var displaySomethingCalled = false
    
    func displaySomething(viewModel: Hero.Something.ViewModel)
    {
      displaySomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentSomething()
  {
    // Given
    let spy = HeroDisplayLogicSpy()
    sut.viewController = spy
    let response = Hero.Something.Response()
    
    // When
    sut.presentSomething(response: response)
    
    // Then
    XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}
