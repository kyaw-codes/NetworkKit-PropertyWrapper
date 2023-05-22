//
//  File.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 19/05/2023.
//

import Foundation

public enum NetworkError: LocalizedError {
    case invalidUrl
    case badResponse(response: Int)
    case decodeError(error: Error)
    case unknown(error: Error)
    case genericError

    public var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "Invalid url."
        case let .badResponse(responseCode):
            return "Bad response code: \(responseCode)."
        case let .decodeError(error):
            return "Failed to decode: \(error.localizedDescription)"
        case .unknown(let error):
            return error.localizedDescription
        case .genericError:
            return "Something went wrong!"
        }
    }
}
