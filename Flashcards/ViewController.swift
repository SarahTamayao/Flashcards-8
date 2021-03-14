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
    
    @IBOutlet weak var card: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Round back label's corners
        backLabel.layer.cornerRadius = 20.0
        
        // Round front label's corners
        frontLabel.layer.cornerRadius = 20.0

        // Round card's corners
        card.layer.cornerRadius = 20.0
        
        // Clip the back label inside the the card
        backLabel.clipsToBounds = true
        
        // Clip the front label inside the the card
        frontLabel.clipsToBounds = true

        // Create shadow's radius
        card.layer.shadowRadius = 15.0
        
        // Create shadow's opacity
        card.layer.shadowOpacity = 0.2
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if frontLabel.isHidden == false {
            frontLabel.isHidden = true
        } else {
            frontLabel.isHidden = false
        }
    }
    
    func updateFlashcard(question: String, answer: String) {
        frontLabel.text = question
        backLabel.text = answer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // We know the destination of the segue is the Navifation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // We set the flashcardsController property to self
        creationController.flashcardsController = self
    }
}

