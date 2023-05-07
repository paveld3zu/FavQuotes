//
//  ViewController.swift
//  FavQuotes
//
//  Created by Pavel Karunnyj on 06.05.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let urlString = "https://favqs.com/api/qotd"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFQuote()
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
