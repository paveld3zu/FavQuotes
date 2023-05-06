//
//  Quote.swift
//  FavQuotes
//
//  Created by Pavel Karunnyj on 06.05.2023.
//

import Foundation

struct FQuote: Decodable {
    let qotd_date: String
    let quote: Quote
}

struct Quote: Decodable {
    let author: String
    let url: String
    let favorites_count: Int
    let upvotes_count: Int
    let downvotes_count: Int
    let body: String
    let tags: [String]
}
