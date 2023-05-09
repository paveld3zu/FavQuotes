//
//  ViewController.swift
//  FavQuotes
//
//  Created by Pavel Karunnyj on 06.05.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    
    
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var favoritesLabel: UILabel!
    @IBOutlet var upvotesLabel: UILabel!
    @IBOutlet var downvotesLabel: UILabel!
    @IBOutlet var tagsLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    @IBOutlet var getQuoteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFQuote()
    }
    @IBAction func getQuoteButtonTapped(_ sender: UIButton) {
    }
}

// MARK: - Networking
extension ViewController {
    private func fetchFQuote() {
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
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
