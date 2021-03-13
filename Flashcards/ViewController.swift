//
//  ViewController.swift
//  Flashcards
//
//  Created by stlp on 2/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if frontLabel.isHidden == false {
            frontLabel.isHidden = true
        } else {
            frontLabel.isHidden = false
        }
    }
    
    func updateFlashcard(question: String, answer: String) {
        // function
    }
    
}

