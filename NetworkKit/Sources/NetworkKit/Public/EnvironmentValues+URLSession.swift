//
//  EnvironmentValues+URLSession.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 19/05/2023.
//

import SwiftUI

public extension EnvironmentValues {
    var urlSession: URLSession {
        get { self[URLSessionKey.self] }
        set { self[URLSessionKey.self] = newValue }
    }
}
