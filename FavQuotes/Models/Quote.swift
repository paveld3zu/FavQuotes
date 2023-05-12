//
//  Quote.swift
//  FavQuotes
//
//  Created by Pavel Karunnyj on 06.05.2023.
//

import Foundation

struct FQuote: Decodable {
    let qotdDate: String
    let quote: Quote
    
    init(qotdDate: String, quote: Quote) {
        self.qotdDate = qotdDate
        self.quote = quote
    }
    
    init(favoriteQuote: [String: Any]) {
        qotdDate = favoriteQuote["qotd_date"] as? String ?? ""
        
        let quoteData = favoriteQuote["quote"] as? [String: Any] ?? [:]
        quote = Quote(from: quoteData)
    }
    
    static func getQuote(from value: Any) -> FQuote {
        guard let quoteData = value as? [String: Any] else {
            return FQuote(favoriteQuote: [:])
        }
        return FQuote(favoriteQuote: quoteData)
    }
    
    struct Quote: Decodable {
        let author: String
        let url: String
        let favoritesCount: Int
        let upvotesCount: Int
        let downvotesCount: Int
        let body: String
        let tags: [String]
        
        init(from quoteData: [String: Any]) {
            author = quoteData["author"] as? String ?? ""
            url = quoteData["url"] as? String ?? ""
            favoritesCount = quoteData["favorites_count"] as? Int ?? 0
            upvotesCount = quoteData["upvotes_count"] as? Int ?? 0
            downvotesCount = quoteData["downvotes_count"] as? Int ?? 0
            body = quoteData["body"] as? String ?? ""
            tags = quoteData["tags"] as? [String] ?? []
        }
    }
}
