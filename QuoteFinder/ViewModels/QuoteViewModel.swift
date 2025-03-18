//
//  QuoteViewModel.swift
//  QuoteFinder
//
//  Created by Neil Shah on 2025-03-18.
//

import Foundation
 
@Observable
class QuoteViewModel {
    
    // MARK: Stored properties
    var currentQuote: Quote?
    
    // MARK: Initializer(s)
    init(currentQuote: Quote? = nil) {
        self.currentQuote = currentQuote
    }
    
}
