//
//  BGExtensionTests.swift
//  BGExtensionTests
//
//  Created by yanyan on 2018/4/9.
//  Copyright © 2018年 PotatoYY. All rights reserved.
//

import XCTest
@testable import BGExtension

class BGExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        XCTAssertEqual("The quick brown fox jumps over the lazy dog".md5, "9e107d9d372bb6826bd81d3542a419d6")
        XCTAssertEqual("The quick brown fox jumps over the lazy dog.".md5, "e4d909c290d0fb1ca068ffaddf22cbd0")
        XCTAssertEqual("".md5, "d41d8cd98f00b204e9800998ecf8427e")
        XCTAssertEqual("md5".md5, "1bc29b36f623ba82aaf6724fd3b16718")
        XCTAssertEqual("abc".md5, "900150983cd24fb0d6963f7d28e17f72")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
