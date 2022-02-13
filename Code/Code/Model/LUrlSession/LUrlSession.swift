//
//  LUrlSession.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit

class LUrlSession: NSObject {
    lazy var sessionManager: URLSession = {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.urlCache = nil
        /*The timeout interval to use when waiting for additional data. The timer associated with this value is reset whenever new data arrives. When the request timer reaches the specified interval without receiving any new data, it triggers a timeout.*/
        sessionConfig.timeoutIntervalForRequest = TimeInterval(30)
        /*The maximum amount of time that a resource request should be allowed to take. This value controls how long to wait for an entire resource to transfer before giving up. The resource timer starts when the request is initiated and counts until either the request completes or this timeout interval is reached, whichever comes first.*/
        sessionConfig.timeoutIntervalForResource = TimeInterval(60)
        return  URLSession(configuration: sessionConfig) //URLSessionConfiguration.default
    }()
}
