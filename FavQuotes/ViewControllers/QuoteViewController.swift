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
    
    @IBOutlet var bodyActivityIndicator: UIActivityIndicatorView!
    
    private let networkManager = NetworkManager.shared
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bodyActivityIndicator.startAnimating()
        bodyActivityIndicator.hidesWhenStopped = true
        authorLabel.isHidden = true
        tagsLabel.isHidden = true
        fetchQuote()
    }
// MARK: - Actions
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        fetchQuote()
    }
}
// MARK: - Networking
extension QuoteViewController {
    private func fetchQuote() {
        networkManager.fetchQuote(from: Link.qotdURL.url) { [weak self] result in
            switch result {
            case .success(let quote):
                self?.updateLabels(with: quote)
            case .failure(let error):
                print(error)
            }
        }
    }
}
// MARK: - UI Update
extension QuoteViewController {
    private func updateLabels(with fQuote: FQuote) {
        bodyLabel.text = fQuote.quote.body
        favoritesLabel.text = String(fQuote.quote.favoritesCount)
        upvotesLabel.text = String(fQuote.quote.upvotesCount)
        downvotesLabel.text = String(fQuote.quote.downvotesCount)
        tagsLabel.text = "Tags: \(fQuote.quote.tags.joined(separator: ", "))"
        tagsLabel.isHidden = false
        authorLabel.text = "Author: \(fQuote.quote.author)"
        authorLabel.isHidden = false
        bodyActivityIndicator.stopAnimating()
    }
}
