//
//  File.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 19/05/2023.
//

import Combine

extension Task {
    func store(in cancellables: inout Set<AnyCancellable>) {
        cancellables.insert(
            AnyCancellable {
                self.cancel()
            }
        )
    }
}
