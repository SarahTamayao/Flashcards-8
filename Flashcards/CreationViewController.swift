//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Gelila Woldesenbet on 3/13/21.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        // Get the text in the question text field
        let questionText = questionTextField.text
        
        // Get the text in the answer text field
        let answerText = answerTextField.text
        
        // Check if question or answer text field is empty
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty) {
            // Create error if user leaves question or answer empty
            let alert = UIAlertController(title: "Missing text", message: "You need a question and answer", preferredStyle: UIAlertController.Style.alert)
            
            // Create cancel button to
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
            // Show alert if user leaves question or answer empty
            present(alert, animated: true)
            
        } else {
            // Call the function to update the flashcard
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
            
            // Dismiss
            dismiss(animated: true)
        }
    }
}
