//
//  ViewController.swift
//  NumberToWordChallenge
//
//  Created by Waseem Akram on 27/08/20.
//  Copyright © 2020 Waseem Akram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Properties
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var wordPreviewLabel: UILabel!
    
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.delegate = self
        numberTextField.addTarget(self, action: #selector(numberTextFieldDidChange(textField:)), for: .editingChanged)
    }

    
    //MARK:- Methods
    
    @objc func numberTextFieldDidChange(textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            wordPreviewLabel.text = "" //empty string doesnt represent anything
            return
        }
        do {
            let text = try NumberToWordFormatter.convert(from: textField.text ?? "")
            wordPreviewLabel.text = text
        }catch let error {
            wordPreviewLabel.text = error.localizedDescription //show error to user
        }
    }

    
}

//MARK:- Delegates


//MARK: UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty { //allow backspace
            return true
        }
        guard Int(string) != nil else { return false } //allow only integers
        return true
    }

}



