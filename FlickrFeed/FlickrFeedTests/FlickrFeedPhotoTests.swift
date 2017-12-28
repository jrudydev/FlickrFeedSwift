//
//  FlickrFeedPhotoTests.swift
//  FlickrFeedTests
//
//  Created by Rudy Gomez on 12/25/17.
//  Copyright © 2017 JRudy Gaming. All rights reserved.
//

import XCTest

let FlickrFeedPhotoTestsItemId1 = "FlickrFeedPhotoTestsItemId1"
let FlickrFeedPhotoTestsItemId2 = "FlickrFeedPhotoTestsItemId2"
let FlickrFeedPhotoTestsPhotoUrl = "http://www.example.com?a=b&c=d"

class FlickrFeedPhotoTests: XCTestCase {
    var values1: Dictionary<String, Any> = [:]
    var values2: Dictionary<String, Any> = [:]
    
    override func setUp() {
        super.setUp()
        
        self.values1 = [
            FlickrFeedPhotoLinkKey: FlickrFeedPhotoTestsItemId1,
            FlickrFeedPhotoMediaKey: [
                FlickrFeedPhotoMKey: FlickrFeedPhotoTestsPhotoUrl
            ]
        ]
        self.values2 = [
            FlickrFeedPhotoLinkKey: FlickrFeedPhotoTestsItemId2,
            FlickrFeedPhotoMediaKey: [
                FlickrFeedPhotoMKey: FlickrFeedPhotoTestsPhotoUrl
            ]
        ]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPhotoCreation() {
        let photo = Photo(dictionary:values1 as NSDictionary)
        let linkStr = values1[FlickrFeedPhotoLinkKey] as! String
        let mediaObject = values1[FlickrFeedPhotoMediaKey]!
        let mediaDict = mediaObject  as! Dictionary<String, Any>
        let m = mediaDict[FlickrFeedPhotoMKey]
        let mStr = m as! String
        
        XCTAssertNotNil(photo);
        XCTAssertEqual(photo.itemId, linkStr)
        XCTAssertEqual(photo.photoUrl.absoluteString, mStr)
        XCTAssertEqual(photo.favorite, false)
    }
    
    func testPhotoEquality() {
        let photo1 = Photo(dictionary:values1 as NSDictionary)
        let photo2 = Photo(dictionary:values1 as NSDictionary)
        let photo3 = Photo(dictionary:values2 as NSDictionary)
        XCTAssert(photo1 == photo2)
        XCTAssert(photo1 != photo3)
    }
}
