//
//  URLSession+Default.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 19/05/2023.
//

import Foundation

public extension URLSession {
    
    static var `default`: URLSession = {
        var config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.allowsConstrainedNetworkAccess = false
        return URLSession(configuration: config)
    }()
}
