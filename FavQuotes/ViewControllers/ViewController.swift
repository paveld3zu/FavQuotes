//
//  ViewController.swift
//  FavQuotes
//
//  Created by Pavel Karunnyj on 06.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let urlString = "https://favqs.com/api/qotd"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQuotes()
    }
}

// MARK: - Networking
extension ViewController {
    private func fetchQuotes() {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let quotes = try decoder.decode(FQuote.self, from: data)
                print(quotes)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
