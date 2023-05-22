//
//  RemoteData.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 19/05/2023.
//

import SwiftUI
import Combine

@propertyWrapper
public struct RemoteData<Value>: DynamicProperty where Value: Decodable {

    @Environment(\.urlSession) var urlSession
    @StateObject private var dataLoader = DataLoader<Value>()

    public var wrappedValue: StatefulResult<Value, NetworkError>? {
        dataLoader.loadedData
    }
    
    public var projectedValue: Self {
        self
    }

    private let endpoint: Endpoint
    
    public init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    public func update() {
        if dataLoader.urlSession == nil { dataLoader.urlSession = urlSession }
        if dataLoader.endpoint == nil { dataLoader.endpoint = endpoint }
        dataLoader.fetchDataIfNeeded()
    }
}
