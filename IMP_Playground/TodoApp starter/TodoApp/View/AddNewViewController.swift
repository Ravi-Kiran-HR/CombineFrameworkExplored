//
//  AddNewViewController.swift
//  TodoApp
//
//  Created by Karin Prater on 04.02.21.
//

import UIKit
import Combine

class AddNewViewController: UIViewController {

    // get reference to viewmodel
    
    var text: String = ""
    
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.addTarget(self, action: #selector(updateText), for: .editingChanged)
    }
    
    @objc func updateText() {
        self.text = textField.text ?? ""
    }
    
    // MARK: - outlets
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        // create new task from textfield

        dismiss()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss()
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
