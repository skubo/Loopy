//
//  Control.swift
//  Loopy
//
//  Created by skubo on 16.05.18.
//  Copyright © 2018 Christian Garbers. All rights reserved.
//

import Foundation

public enum ControlStatus
{
    case virgin
    case bootstrapping
    case error
    case online
}

public enum ControlErrors
{
    case cameraNotAvailable
    case audioNotAvailable
    case noCameraPermission
    case noAudioPermission
    case baseURLInaccessible
}

open class ControlOptions : NSObject
{
    public var video = true
    public var audio = true
    public var baseURL : URL?
}

open class Control: NSObject {
    
    public var status : ControlStatus = ControlStatus.virgin
    public var errors = [ControlErrors]()
    
    //
    // Bootstrapping, initialize file storage, notification listener,
    // camera/mic, etc.
    //
    open func bootstrap(options: ControlOptions) -> ControlStatus
    {
        return ControlStatus.error
    }
}
