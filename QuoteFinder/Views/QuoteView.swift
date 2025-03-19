//
//  ContentView.swift
//  QuoteFinder
//
//  Created by Neil Shah on 2025-03-03.
//

import SwiftUI

struct QuoteView: View {
    
    // MARK: Stored properties
    @State var viewModel = QuoteViewModel()
    
    // Controls button visibility
    @State var buttonOpacity = 0.0
    
    // Starts a timer to show button
    @State var buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    // MARK: Computed properties
    var body: some View {
        VStack (alignment: .center) {
            if let currentQuote = viewModel.currentQuote {
                
                Text("\(Image(systemName: "quote.opening")) \(currentQuote.quoteText ?? "") \(Image(systemName: "quote.closing"))")
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                Text("~ ")
                    .font(.system(size: 24, weight: .bold))
                + Text(currentQuote.quoteAuthor ?? "")
                    .font(.system(size: 24, weight: .bold))
                
                Button {
                    withAnimation {
                        viewModel.currentQuote = nil
                        buttonOpacity = 0.0
                    }
                    
                    // Get a new quote
                    Task {
                        await viewModel.fetchQuote()
                    }
                    
                    // Restart timer
                    buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
                    
                } label: {
                    
                    Text("Next Quote")
                        .font(.system(size: 20, weight: .bold))
                        .padding(12)
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
                .opacity(buttonOpacity)
                .onReceive(buttonTimer) { _ in
                    withAnimation {
                        buttonOpacity = 1.0
                    }
                    buttonTimer.upstream.connect().cancel()
                }
            }
        }
        .padding()
    }
}

#Preview {
    QuoteView()
}
