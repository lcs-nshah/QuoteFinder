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
        VStack {
            if let currentQuote = viewModel.currentQuote {
                Group {
                    Text(currentQuote.quoteText ?? "")
                        .padding(.bottom, 100)
                    
                    Text(currentQuote.quoteAuthor ?? "")
                }
                .font(.title)
                .multilineTextAlignment(.center)
                
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
                }
                .buttonStyle(.borderedProminent)
                .opacity(buttonOpacity)
                .onReceive(buttonTimer) { _ in
                    withAnimation {
                        buttonOpacity = 1.0
                    }
                    
                    // Stop the timer
                    buttonTimer.upstream.connect().cancel()
                }
            }
        }
    }
}

#Preview {
    QuoteView()
}
