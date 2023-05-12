//
//  NetworkManager.swift
//  FavQuotes
//
//  Created by Pavel Karunnyj on 09.05.2023.
//

import Foundation
import Alamofire

enum Link {
    case qotdURL
    
    var url: URL {
        switch self {
        case .qotdURL:
            return URL(string: "https://favqs.com/api/qotd")!
        }
    }
}

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Networking
    
    func fetchQuote(from url: URL, completion: @escaping(Result<FQuote, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let quote = FQuote.getQuote(from: value)
                    completion(.success(quote!))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
