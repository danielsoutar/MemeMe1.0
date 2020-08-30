//
//  TextFieldDelegate.swift
//  ImagePickerTest
//
//  Created by Daniel Soutar on 30/08/2020.
//  Copyright © 2020 Daniel Soutar. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITextFieldDelegate {
    
    // MARK: - Configuring Text Fields
    
    func configureTextFields() {
        topTextField.delegate = self
        bottomTextField.delegate = self
        
        topTextField.autocorrectionType = .no
        bottomTextField.autocorrectionType = .no
        
        // Note: The negative stroke width is required for coloured
        // text!
        let memeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            .strokeWidth: -2
        ]
        
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        
        topTextField.textAlignment = .center
        topTextField.text = DEFAULT_TOP_TEXT
        bottomTextField.textAlignment = .center
        bottomTextField.text = DEFAULT_BOT_TEXT
    }
    
    // MARK: - Implement the UITextFieldDelegate Protocol
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Assign flag to whether the bottom text field is the one editing, since
        // this is used to configure the keyboard-view manipulation.
        // Although equality between text fields can be risky (many fields beside text
        // also need to compare equal), this is safe since the only objects
        // that call this are manipulated in the ViewController.
        self.bottomSwitchIsEditing = textField == self.bottomTextField

        // Only remove the text if it's the default. A placeholder would do this better.
        if textField.text == DEFAULT_TOP_TEXT || textField.text == DEFAULT_BOT_TEXT {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
}
