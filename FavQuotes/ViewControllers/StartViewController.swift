//
//  StartViewController.swift
//  FavQuotes
//
//  Created by Pavel Karunnyj on 10.05.2023.
//

import UIKit

final class StartViewController: UIViewController {

    var quote: Quote!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let quoteVC = segue.destination as? QuoteViewController else { return }
        quoteVC.quote = quote
    }

    @IBAction func getQuoteButtonTapped(_ sender: UIButton) {
    }
}
