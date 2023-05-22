//
//  UserListView.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 19/05/2023.
//

import SwiftUI

struct UserListView: View {
    @RemoteData(endpoint: .users)
    var userResult: StatefulResult<[User], NetworkError>?
    
    var body: some View {
        StatefulResult.unwrapped(userResult) { users in
            UserList(users: users)
        }
        .navigationTitle("Users")
    }
    
    @ViewBuilder
    private func UserList(users: [User]) -> some View {
        List(users) { user in
            UserCell(user)
        }
    }
    
    @ViewBuilder
    private func UserCell(_ user: User) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(user.name).font(.headline)
            +
            Text(" (\(user.website))").foregroundColor(.pink)
            
            Text(user.email)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserListView()
        }
        .environment(\.urlSession, .default)
    }
}
