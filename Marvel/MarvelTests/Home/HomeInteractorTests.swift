//
//  HomeInteractorTests.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 12/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

@testable import Marvel
import XCTest

class HomeInteractorTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: HomeInteractor!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupHomeInteractor()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupHomeInteractor()
  {
    sut = HomeInteractor()
  }
  
  // MARK: Test doubles
  
  class HomePresentationLogicSpy: HomePresentationLogic
  {
    var presentSomethingCalled = false
    
    func presentSomething(response: Home.Something.Response)
    {
      presentSomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testDoSomething()
  {
    // Given
    let spy = HomePresentationLogicSpy()
    sut.presenter = spy
    let request = Home.Something.Request()
    
    // When
    sut.doSomething(request: request)
    
    // Then
    XCTAssertTrue(spy.presentSomethingCalled, "doSomething(request:) should ask the presenter to format the result")
  }
}
