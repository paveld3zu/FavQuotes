//
//  NetworkManager.swift
//  FavQuotes
//
//  Created by Pavel Karunnyj on 09.05.2023.
//

import Foundation

let urlString = "https://favqs.com/api/qotd"

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
}

