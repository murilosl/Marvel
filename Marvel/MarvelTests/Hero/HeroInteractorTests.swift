//
//  HeroInteractorTests.swift
//  Marvel
//
//  Created by Murilo de Souza Lopes on 12/07/2019.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//

@testable import Marvel
import XCTest

class HeroInteractorTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: HeroInteractor!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupHeroInteractor()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupHeroInteractor()
  {
    sut = HeroInteractor()
  }
  
  // MARK: Test doubles
  
  class HeroPresentationLogicSpy: HeroPresentationLogic
  {
    var presentSomethingCalled = false
    
    func presentSomething(response: Hero.Something.Response)
    {
      presentSomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testDoSomething()
  {
    // Given
    let spy = HeroPresentationLogicSpy()
    sut.presenter = spy
    let request = Hero.Something.Request()
    
    // When
    sut.doSomething(request: request)
    
    // Then
    XCTAssertTrue(spy.presentSomethingCalled, "doSomething(request:) should ask the presenter to format the result")
  }
}
