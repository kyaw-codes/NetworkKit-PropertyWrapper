//
//  DataLoader.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 19/05/2023.
//

import Foundation
import Combine

@MainActor
class DataLoader<Value>: ObservableObject where Value: Decodable {
    @Published var loadedData: StatefulResult<Value, NetworkError>!
    var urlSession: URLSession?
    var endpoint: Endpoint?
    
    private var isLoadingData = false
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchDataIfNeeded(type: Value.Type = Value.self) {
        defer { isLoadingData = false }
        
        /// If currently loading is `true`, we don't want to do anything
        guard !isLoadingData else { return }
        
        guard let urlSession, let endpoint else {
            loadedData = .failure(.genericError)
            return
        }
        guard let url = try? endpoint.asURL() else {
            loadedData = .failure(.invalidUrl)
            return
        }
        
        isLoadingData = true
        let request = URLRequest(url: url)
        
        Task {
            do {
                loadedData = .success(try await fetchAndDecode(urlSession, request: request))
            } catch {
                if let networkError = error as? NetworkError {
                    loadedData = .failure(networkError)
                } else {
                    loadedData = .failure(.unknown(error: error))
                }
            }
        }.store(in: &cancellables)
    }
    
    private func fetchAndDecode(_ session: URLSession, request: URLRequest) async throws -> Value {
        let (data, response) = try await session.data(for: request)
        let httpResponse = response as? HTTPURLResponse ?? HTTPURLResponse()
        
        guard (200 ..< 300).contains(httpResponse.statusCode) else {
            throw NetworkError.badResponse(response: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(Value.self, from: data)
        } catch {
            throw NetworkError.decodeError(error: error)
        }
    }
}
