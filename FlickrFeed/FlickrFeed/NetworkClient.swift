//
//  NetworkClient.swift
//  FlickrFeed
//
//  Created by Rudy Gomez on 12/22/17.
//  Copyright © 2017 JRudy Gaming. All rights reserved.
//

import UIKit

typealias NetworkResult = (AnyObject?, Error?) -> Void
typealias ImageResult = (UIImage?, Error?) -> Void

public class NetworkClient {
    private var urlSession: URLSession
    static let sharedInstance = NetworkClient()
    
    init() {
        let configuration = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: configuration)
    }
    
    // MARK: Services Methods
    
    func getURL(url: URL, completion: @escaping NetworkResult) {
       completion(nil, nil)
    }
    
    // MARK: Helper Methods
    
    func parseJSON(data:NSData, completion: @escaping NetworkResult) {
        completion(nil, nil);
    }
}
