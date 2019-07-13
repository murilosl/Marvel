//
//  HomePresenterTests.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 12/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

@testable import Marvel
import XCTest

class HomePresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: HomePresenter!
  var characters: MockCharacter?
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupHomePresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupHomePresenter()
  {
    sut = HomePresenter()
  }
  
  // MARK: Test doubles
  
  class HomeDisplayLogicSpy: HomeDisplayLogic
  {
    var displaySomethingCalled = false
    
    func displaySomething(viewModel: Home.Something.ViewModel)
    {
      displaySomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentSomething()
  {
    // Given
    let spy = HomeDisplayLogicSpy()
    sut.viewController = spy
    //let response = Home.Something.Response(characters: characters)
    
    // When
    //sut.presentSomething(response: response)
    
    // Then
    XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}
