//
//  NetworkClientTests.swift
//  FlickrFeedTests
//
//  Created by Rudy Gomez on 12/22/17.
//  Copyright © 2017 JRudy Gaming. All rights reserved.
//

import XCTest
@testable import FlickrFeed

class FlickrFeedNetworkClientTests: XCTestCase {
    
    var networkClient = MockNetworkClient()
    
    static var item1NetworkResult: NSDictionary = [:]
    static var item2NetworkResult: NSDictionary = [:]
    
    override func setUp() {
        super.setUp()
        FlickrFeedNetworkClientTests.item1NetworkResult = [
            FlickrFeedPhotoLinkKey: FlickrFeedPhotoTestsItemId1,
            FlickrFeedPhotoMediaKey: [
                FlickrFeedPhotoMKey: FlickrFeedPhotoTestsPhotoUrl
            ]
        ]
        FlickrFeedNetworkClientTests.item2NetworkResult = [
            FlickrFeedPhotoLinkKey: FlickrFeedPhotoTestsItemId2,
            FlickrFeedPhotoMediaKey: [
                FlickrFeedPhotoMKey: FlickrFeedPhotoTestsPhotoUrl
            ]
        ]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNetworkClientGetUrl() {
        let expect = expectation(description: "Network call and closure")
        
        networkClient.getURL(url: URL(string:"https://api.flickr.com")!) {
            (response, error) in
            let responseItem = (response as? NSDictionary)!
            let mockItem = FlickrFeedNetworkClientTests.item1NetworkResult
            
            XCTAssert(responseItem == mockItem, "Values do not match")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                let errStr = error.localizedDescription
                XCTFail("waitForExpectationsWithTimeout error: \(errStr)")
            }
        }
    }
    
    func testNetworkClientParseJSON() {
        let jsonData = NSKeyedArchiver.archivedData(
            withRootObject: FlickrFeedNetworkClientTests.item1NetworkResult)
        
        networkClient.parseJSON(data: jsonData as NSData) {
            (result, error) in
            if let error = error {
                XCTAssert(true, "Error parsing data\(error.localizedDescription)")
                return
            }
            
            let resultItem = (result as? NSDictionary)!
            let mockItem = FlickrFeedNetworkClientTests.item1NetworkResult
            
            XCTAssert(resultItem == mockItem, "Values do not match")
        }
    }
    
    // MARK: Mock Objects

    class MockNetworkClient: NetworkClient {
        override func getURL(url: URL, completion: @escaping NetworkResult) {
            completion(FlickrFeedNetworkClientTests.item1NetworkResult, nil)
        }
        
        override func parseJSON(data:NSData, completion: @escaping NetworkResult) {
            completion(FlickrFeedNetworkClientTests.item1NetworkResult, nil)
        }
    }
    
    //    class MockURLSessionDataTask: URLSessionDataTask {
    //        var didResume = false
    //
    //        override func dataTask(url: NSURL) ->
    //    }
    //
    //    class MockURLSession: URLSession {
    //
    //    }
}
