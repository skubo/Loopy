//
//  Recordings.swift
//  Loopy
//
//  Created by skubo on 16.05.18.
//  Copyright © 2018 Christian Garbers. All rights reserved.
//

import Foundation

open class Recordings: NSObject {
    
    //
    // return a list of (file-)URLs of any present recordings
    //
    open static func read() -> [URL]
    {
        return [URL]()
    }
}
