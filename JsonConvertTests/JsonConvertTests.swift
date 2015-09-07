//
//  JsonConvertTests.swift
//  JsonConvertTests
//
//  Created by 嘉伟白 on 15/7/27.
//  Copyright (c) 2015年 GarveyCalvin. All rights reserved.
//

import UIKit
import XCTest
import JsonConvert

class JsonConvertTests: XCTestCase {
    
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
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testToDic() {
        let json = "{\"name\":\"Garvey\",\"age\":\"21\"}"
        if let dic = GCJson.toDic(json) {
            println(dic)
            XCTAssertNotNil(dic, "dic should not nil")
            let bool = dic.isKindOfClass(NSDictionary)
            XCTAssertTrue(bool, "bool should be true")
            return
        }
        
        XCTFail("dic should not be nil")
    }
    
    func testToArray() {
        let json = "[{\"name\":\"Garvey\",\"age\":\"21\"}]"
        if let array = GCJson.toArray(json) {
            println(array)
            XCTAssertNotNil(array, "array should not be nil")
            let bool = array.isKindOfClass(NSArray)
            XCTAssertTrue(bool, "bool should be true")
            return
        }
        
        XCTFail("array should not be nil")
    }
    
    func testToJson() {
        let array = ["name", "age"]
        let dic = ["name": "Garvey", "age": "21"]
        
        if let jsonArray = GCJson.toJson(array) {
            println(jsonArray)
            XCTAssertNotNil(jsonArray, "array should not be nil")
            let bool = jsonArray.isKindOfClass(NSString)
            XCTAssertTrue(bool, "bool should be true")
            return
        }
        
        XCTFail("jsonArray should not be nil")
    
        if let jsonDic = GCJson.toJson(dic) {
            println(jsonDic)
            XCTAssertNotNil(jsonDic, "jsonDic should not be nil")
            let bool = jsonDic.isKindOfClass(NSString)
            XCTAssertTrue(bool, "bool should be true")
            return
        }
        
        XCTFail("jsonDic should not be nil")
    }
    
    func testToDicFromFile() {
        if let filePath = NSBundle.mainBundle().pathForResource("JsonDicFile", ofType: "geojson") {
            if let dic = GCJson.toDicFromFile(filePath) {
                println(dic)
                XCTAssertNotNil(dic, "dic should not nil")
                let bool = dic.isKindOfClass(NSDictionary)
                XCTAssertTrue(bool, "bool should be true")
                return
            }
            XCTFail("dic should not be nil")
            return
        }
        XCTFail("filePath should not be nil")
    }
    
    func testToArrayFromFile() {
        if let filePath = NSBundle.mainBundle().pathForResource("JsonArrayFile", ofType: "geojson") {
            if let array = GCJson.toArrayFromFile(filePath) {
                println(array)
                XCTAssertNotNil(array, "dic should not nil")
                let bool = array.isKindOfClass(NSArray)
                XCTAssertTrue(bool, "bool should be true")
                return
            }
            XCTFail("array should not be nil")
            return
        }
        
        XCTFail("filePath should not be nil")
    }
    
}
