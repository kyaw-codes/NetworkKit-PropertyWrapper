//
//  StatefulResult.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 19/05/2023.
//

import Foundation
import SwiftUI

public enum StatefulResult<Result, Failure> where Result: Decodable, Failure: Error {
    case loading
    case success(Result)
    case failure(Failure)
}

public extension StatefulResult {
    @ViewBuilder
    static func unwrapped(
        _ result: StatefulResult<Result, Failure>?,
        @ViewBuilder loadingView: () -> some View = { ProgressView() },
        @ViewBuilder resultView: (Result) -> some View,
        @ViewBuilder errorView: (Error) -> some View = { Text($0.localizedDescription).foregroundColor(.red) }
    ) -> some View {
        switch result ?? .loading {
        case .loading:
            loadingView()
        case let .success(data):
            resultView(data)
        case let .failure(error):
            errorView(error)
        }
    }

}
