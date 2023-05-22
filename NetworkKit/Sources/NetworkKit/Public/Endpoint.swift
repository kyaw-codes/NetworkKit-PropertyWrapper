//
//  Endpoint.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 19/05/2023.
//

import Foundation

public enum Endpoint {
    case users
    case posts
    case comments
    
    public var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    public var path: String {
        switch self {
        case .users:
            return "/users"
        case .posts:
            return "/posts"
        case .comments:
            return "/comments"
        }
    }
    
    public func asURL() throws -> URL {
        baseURL.appendingPathComponent(path)
    }
}
