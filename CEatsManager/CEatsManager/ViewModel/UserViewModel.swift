//
//  UserViewModel.swift
//  CEatsManager
//
//  Created by Jisoo HAM on 2023/09/13.
//

import Foundation

final class UserViewModel: ObservableObject {
    @Published var user: User = User.sampleData
}
