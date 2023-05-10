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
    
//    func fetchFQuote(from url: URL, completion: @escaping(Result<FQuote, NetworkError>) -> Void) {
//        guard let url = URL(string: urlString) else { return }
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data else {
//                completion(.failure(.noData))
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let quote = try decoder.decode(FQuote.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(quote))
//                }
//                print(quote)
//            } catch {
//                print(error.localizedDescription)
//                completion(.failure(.decodingError))
//            }
//        }.resume()
//    }
    
    
//    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping (Result<T, NetworkError>) ->Void) {
//        URLSession.shared.dataTask(with: url) {data, _, error in
//            guard let data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let quote = try decoder.decode(T.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(quote))
//                    print(quote)
//                }
//            } catch {
//                completion(.failure(.decodingError))
//                
//            }
//            
//        }.resume()
//    }
//    
//}
