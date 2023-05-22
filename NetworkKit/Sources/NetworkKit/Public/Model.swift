//
//  Model.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 19/05/2023.
//

import Foundation

public struct User: Codable, Identifiable {
    public let id: Int
    public let name: String
    public let username: String
    public let email: String
    public let phone: String
    public let website: String
}

public struct Post: Codable, Identifiable {
    public let userId: Int
    public let id: Int
    public let title: String
    public let body: String
}

public struct Comment: Codable, Identifiable {
    public let postId: Int
    public let id: Int
    public let name: String
    public let email: String
    public let body: String
}
