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
    
    enum CodingKeys: String, CodingKey {
        case qotdDate = "qotd_date"
        case quote = "quote"
    }
}

struct Quote: Decodable {
    let author: String
    let url: String
    let favoritesCount: Int
    let upvotesCount: Int
    let downvotesCount: Int
    let body: String
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case url = "url"
        case favoritesCount = "favorites_count"
        case upvotesCount = "upvotes_count"
        case downvotesCount = "downvotes_count"
        case body = "body"
        case tags = "tags"
    }
}
