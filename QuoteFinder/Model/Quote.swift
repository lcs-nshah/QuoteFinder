//
//  Untitled.swift
//  QuoteFinder
//
//  Created by Neil Shah on 2025-03-03.
//

import Foundation

struct Quote: Codable {
    
    // MARK: Stored Properties
    let quoteText: String
    let quoteAuthor: String
    let senderName: String
    let senderLink: String
    let quoteLink: String
}

// Create an example quote
let exampleQuote = Quote(
    quoteText: "Beauty is not in the face; beauty is a light in the heart. ",
    quoteAuthor: "Kahlil Gibran",
    senderName: "",
    senderLink: "",
    quoteLink: "http://forismatic.com/en/cb821150f3/"
)
