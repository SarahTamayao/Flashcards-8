//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Gelila Woldesenbet on 3/12/21.
//

import UIKit

class CreationViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func didTapOnDone(_ sender: Any) {
    }
    
}
