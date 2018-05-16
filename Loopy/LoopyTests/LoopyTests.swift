//
//  LoopyTests.swift
//  LoopyTests
//
//  Created by skubo on 16.05.18.
//  Copyright © 2018 Christian Garbers. All rights reserved.
//

import XCTest
@testable import Loopy

class LoopyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //
    // Uninitialized framework shall not return any recording URLs and not return nil
    //
    func testUninitializedRecordings() {
        
        let recs = Recordings.read()
        XCTAssertNotNil(recs)
        XCTAssertTrue(recs.count == 0)
        
    }
    
    func testVirginState()
    {
        let control = Control()
        XCTAssertTrue(control.status == ControlStatus.virgin)
        XCTAssertTrue(control.errors.count == 0)
    }

    func testInvalidURL()
    {
        let options = ControlOptions()
        options.baseURL = URL(fileURLWithPath: "/var/srv")
        let control = Control()
        let status = control.bootstrap(options: options)
        XCTAssertTrue(status == ControlStatus.error)
        XCTAssertTrue(control.status == ControlStatus.error)
        XCTAssertTrue(control.errors.count == 1)
        XCTAssertTrue(control.errors.contains(ControlErrors.baseURLInaccessible))
    }
    

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
}
