//
//  Photo.swift
//  FlickrFeed
//
//  Created by Rudy Gomez on 12/18/17.
//  Copyright © 2017 JRudy Gaming. All rights reserved.
//

import UIKit

let FlickrFeedPhotoLinkKey = "link"
let FlickrFeedPhotoMediaKey = "media"
let FlickrFeedPhotoMKey = "m"

class Photo: NSObject {
    var itemId: String
    var photoUrl: URL
    var favorite = false
    
    static let itemIdKey = "itemId"
    static let phtotoUrlKey = "photoUrl"
    static let favoriteKey = "favorite"
    
    init(dictionary values: NSDictionary) {
        guard let link = values[FlickrFeedPhotoLinkKey] as? String else {
            fatalError("Photo item could not be created" + values.description)
        }
        itemId = link
        
        guard let media = values[FlickrFeedPhotoMediaKey] as? NSDictionary,
            let urlString = media[FlickrFeedPhotoMKey] as? String,
            let url = URL(string:urlString) else {
            fatalError("Photo item could not be created" + values.description)
        }
        photoUrl = url
    }
}

// MARK: Equatable

func == (first: Photo, second: Photo) -> Bool {
    return first.itemId == second.itemId
}
