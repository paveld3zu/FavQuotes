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
    
    @IBOutlet var bodyActivityIndicator: UIActivityIndicatorView!
    
    var quote: Quote!
    
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bodyActivityIndicator.startAnimating()
        bodyActivityIndicator.hidesWhenStopped = true
        authorLabel.isHidden = true
        tagsLabel.isHidden = true
        fetchQuote()
    }
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        fetchQuote()
    }
}
// MARK: - Networking
extension QuoteViewController {
    private func fetchQuote() {
        guard let url = URL(string: urlString) else { return }
        networkManager.fetch(from: url) { [weak self] result in
            switch result {
            case .success(let quote):
                self?.updateLabels(with: quote.quote)
            case .failure(let error):
                print(error)
            }
        }
    }
}
// MARK: - UI Update
extension QuoteViewController {
    private func updateLabels(with quote: Quote) {
        bodyLabel.text = quote.body
        favoritesLabel.text = String(quote.favoritesCount)
        upvotesLabel.text = String(quote.upvotesCount)
        downvotesLabel.text = String(quote.downvotesCount)
        tagsLabel.text = "Tags: \(quote.tags.joined(separator: ", "))"
        tagsLabel.isHidden = false
        authorLabel.text = "Author: \(quote.author)"
        authorLabel.isHidden = false
        bodyActivityIndicator.stopAnimating()
    }
}
