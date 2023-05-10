//
//  ViewController.swift
//  FavQuotes
//
//  Created by Pavel Karunnyj on 06.05.2023.
//

import UIKit

final class QuoteViewController: UIViewController {
    
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var favoritesLabel: UILabel!
    @IBOutlet var upvotesLabel: UILabel!
    @IBOutlet var downvotesLabel: UILabel!
    @IBOutlet var tagsLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    @IBOutlet var getQuoteButton: UIButton!
    
    var quote: Quote!
    
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQuote()
    }
}

// MARK: - Networking
extension QuoteViewController {
    private func fetchQuote() {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let decoder = JSONDecoder()
                let quote = try decoder.decode(FQuote.self, from: data)
                print(quote)
                DispatchQueue.main.async {
                    self.bodyLabel.text = quote.quote.body
                    self.favoritesLabel.text = String(quote.quote.favoritesCount)
                    self.upvotesLabel.text = String(quote.quote.upvotesCount)
                    self.downvotesLabel.text = String(quote.quote.downvotesCount)
                    self.tagsLabel.text = "Tags: \(quote.quote.tags.joined(separator: ", "))"
                    self.authorLabel.text = "Author: \(quote.quote.author)"
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}