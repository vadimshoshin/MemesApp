//
//  Meme.swift
//  MemesApp
//
//  Created by Vadim Shoshin on 10.12.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class Meme: NSObject, NSCoding {

    var id: Int
    var url: URL
    var name: String
    var height: Int
    var width: Int
    
    init(id: Int, url: URL, name: String, height: Int, width: Int) {
        self.id = id
        self.url = url
        self.name = name
        self.height = height
        self.width = width
        super.init()
    }
    
    init?(json: JSON) {
        guard let url = json["url"].url else { return nil }
        self.height = json["height"].intValue
        self.name = json["name"].stringValue
        self.id = json["id"].intValue
        self.width = json["width"].intValue
        self.url = url
        super.init()
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: Keys.id)
        aCoder.encode(self.url, forKey: Keys.url)
        aCoder.encode(self.name, forKey: Keys.name)
        aCoder.encode(self.height, forKey: Keys.height)
        aCoder.encode(self.width, forKey: Keys.width)
    }

    required convenience init?(coder decoder: NSCoder) {
        guard let objectId = decoder.decodeObject(forKey: Keys.id) as? Int else { return nil }
        guard let objectUrl = decoder.decodeObject(forKey: Keys.url) as? URL else { return nil }
        guard let objectName = decoder.decodeObject(forKey: Keys.name) as? String else { return nil }
        guard let objectHeight = decoder.decodeObject(forKey: Keys.height) as? Int else { return nil }
        guard let objectWidth = decoder.decodeObject(forKey: Keys.width) as? Int else { return nil }
        //else { debugPrint("couldn't decode"); return }
        
        self.init(id: objectId, url: objectUrl, name: objectName, height: objectHeight, width: objectWidth)

    }
}

//extension Meme {
//    static func == (lhs: Meme, rhs: Meme) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
