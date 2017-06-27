//
//  FirstDemoTests.swift
//  FirstDemoTests
//
//  Created by Andy Wu on 6/25/17.
//  Copyright © 2017 Andy Wu. All rights reserved.
//

import XCTest
@testable import FirstDemo

class FirstDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testNumberOfVowelsInString_ShouldReturnNumberOfVowels() {
		let viewController = ViewController()
		let string = "Dominik"
		let numberOfVowels = viewController.numberOfVowelsInString(string)
		XCTAssertEqual(numberOfVowels, 3, "should find 3 vowels in Dominik")
	}
    
}
