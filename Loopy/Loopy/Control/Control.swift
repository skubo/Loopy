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
        errors.removeAll()
        status = ControlStatus.bootstrapping
        
        // check given URL
        if options.baseURL != nil
        {
            var urlString = options.baseURL!.absoluteString
            if !urlString.hasSuffix("/")
            {
                urlString.append("/")
            }
            let writable = FileManager.default.isWritableFile(atPath: urlString)
            if !writable
            {
                status = ControlStatus.error
                errors.append(ControlErrors.baseURLInaccessible)
                return status
            }
        }
        return ControlStatus.online
    }
}
