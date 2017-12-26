//
//  Photo+Services.swift
//  FlickrFeed
//
//  Created by Rudy Gomez on 12/26/17.
//  Copyright © 2017 JRudy Gaming. All rights reserved.
//

import Foundation

let FlickrFeedPhotoServiceUrl = "http://api.flikr.com"
let FlickrFeedPhotoServicePath = "services/feeds"
let FlickrFeedPhotoServiceFile = "photos_public.gne"
let FlickrFeedPhotoServiceQuery = "format=json&nojsoncallback=1"

enum PhotoServiceError: String, Error {
    case NotImplemented = "This feature has not been implemented"
    case URLParsing = "Sorry, there was an error getting the photo"
    case JSONStructure = "Sorry, the photo service returned an invalude structure"
}

typealias PhotoResult = ([Photo]?, Error?) -> Void

extension Photo {
    class func getAllFeedPhotos(completion: @escaping PhotoResult) {
        // TODO: Get url from network client
    }
}
