//
//  UserDefaultsViewControllerTests.swift
//  UserDefaultsTests
//
//  Created by waheedCodes on 15/11/2021.
//

import XCTest
@testable import UserDefaults

class UserDefaultsViewControllerTests: XCTestCase {
    
    // MARK: - Test Fixtures
    
    private var sut: UserDefaultsViewController!
    private var defaults: FakeUserDefaults!
    
    override func setUp() {
        super.setUp()
        sut = makeSUT()
        defaults = FakeUserDefaults()
        sut.userDefault = defaults
    }
    
    override func tearDown() {
        sut = nil
        defaults = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_withEmptyUserDefaults_shouldShow0InCounterLabel() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.counterLabel.text, "0")
    }
    
    func test_viewDidLoad_with1InUserDefaults_shouldShow1InCounterLabel() {
        defaults.integers = ["count": 1]
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.counterLabel.text, "1")
    }
    
    func test_tappingButton_with10InUserDefaults_shouldWrite11ToUserDefaults() {
        defaults.integers = ["count": 10]
        sut.loadViewIfNeeded()
        
        tap(sut.incrementButton)
        
        XCTAssertEqual(defaults.integers["count"], 11)
    }
    
    func test_tappingButton_with78InUserDefaults_shouldShow79InCounterLabel() {
        defaults.integers = ["count": 78]
        sut.loadViewIfNeeded()
        
        tap(sut.incrementButton)
        
        XCTAssertEqual(sut.counterLabel.text, "79")
    }
    
    // MARK: - Helper Method
    
    private func makeSUT() -> UserDefaultsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(
            identifier: String(
                describing: UserDefaultsViewController.self
            )
        )
    }
}
