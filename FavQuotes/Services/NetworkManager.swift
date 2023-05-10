//
//  NetworkManager.swift
//  FavQuotes
//
//  Created by Pavel Karunnyj on 09.05.2023.
//

import Foundation

let urlString = "https://favqs.com/api/qotd"

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
// MARK: - Networking
    func fetch(from url: URL, completion: @escaping(Result<FQuote, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dataModel = try decoder.decode(FQuote.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
