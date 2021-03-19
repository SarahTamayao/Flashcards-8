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
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
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
        
        // Round button option one's corners
        btnOptionOne.layer.cornerRadius = 20.0
        
        // Customize button option one's border width
        btnOptionOne.layer.borderWidth = 3.0
        
        // Customize button option one's border color
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        // Round button option two's corners
        btnOptionTwo.layer.cornerRadius = 20.0
        
        // Customize button option two's border width
        btnOptionTwo.layer.borderWidth = 3.0
        
        // Customize button option two's border color
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        // Round button option three's corners
        btnOptionThree.layer.cornerRadius = 20.0
        
        // Customize button option three's border width
        btnOptionThree.layer.borderWidth = 3.0
        
        // Customize button option three's border color
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if frontLabel.isHidden == false {
            frontLabel.isHidden = true
        } else {
            frontLabel.isHidden = false
        }
    }
    
    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true
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
        if (segue.identifier == "EditSegue") {
            
            // Add the question the user inputs onto the flashcard
            creationController.initialQuestion = frontLabel.text
            
            // Add the answer the user inputs onto the flashcard
            creationController.initialAnswer = backLabel.text
        }
    }
}

