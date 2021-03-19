//
//  ViewController.swift
//  Flashcards
//
//  Created by stlp on 2/26/21.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    // Array to hold our flashcards
    var flashcards = [Flashcard]()
    
    // Current flashcard index
    var currentIndex = 0
    
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
        
        // Start the app with a flashcard question and answer
        updateFlashcard(question: "How old is Wintana?", answer: "20 years old")
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
    
    @IBAction func didTapOnNext(_ sender: Any) {
        // Increase current index
        currentIndex = currentIndex + 1
        
        // Logging to the console
        print("😎 The current index is \(currentIndex)")
        
        // Update labels
        updateLabels()
        
        // Update buttons
        updateNextPrevButtons()
        
        // Logging to the console
        print("😎 Next button worked")
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        // Decrease current index
        currentIndex = currentIndex - 1
        
        // Logging to the console
        print("😎 The current index is \(currentIndex)")
        
        // Update labels
        updateLabels()
        
        // Update buttons
        updateNextPrevButtons()
        
        // Logging to the console
        print("😎 Prev button worked")
    }
    
    func updateFlashcard(question: String, answer: String) {
        // Create a flashcard
        let flashcard = Flashcard(question: question, answer: answer)
        
        // Adding flashcard in the flashcards array
        flashcards.append(flashcard)
        
        // Logging to the console
        print("😎 Added new flashcard")
        print("😎 We now have \(flashcards.count) flashcards")
        
        // Update current index
        currentIndex = flashcards.count - 1
        print("😎 Our current index is \(currentIndex)")
        
        // Update buttons
        updateNextPrevButtons()
        
        // Update labels
        updateLabels()
    }
    
    func updateNextPrevButtons() {
        // Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        // Disable prev button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        // Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        // Update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
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

