//
//  AlvinAITests.swift
//  AlvinAITests
//
//  Created by Neegbeah Reeves on 12/31/16.
//  Copyright © 2016 Neegbeah Reeves. All rights reserved.
//

import XCTest
import ApiAI

@testable import AlvinAI


class AlvinAITests: XCTestCase {
    
    let apiAi: ApiAI! = nil

    
    override func setUp() {
        super.setUp()
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
    
    func testAPIResult(){

        let request = apiAi.textRequest()
        
        request?.query = ["Who Are You"]
        
    
        apiAi.enqueue(request)

    }
    
    func testAPIVoiceResult(){

        let request = apiAi.voiceRequest()
   
        apiAi.enqueue(request)

    }
    
}
