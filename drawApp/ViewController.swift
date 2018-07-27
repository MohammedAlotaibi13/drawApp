//
//  ViewController.swift
//  drawApp
//
//  Created by محمد عايض العتيبي on 09/11/1439 AH.
//  Copyright © 1439 code schoole. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    // MARK: Outlets
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    
    // MARK: Varibales
    
    var trackNumber = 2
    var randomNumber = 0
    var oddsNumber  = 2
    var arr = [String]()
    
    // MARK: Actions
    
    @IBAction func step(_ sender: UIStepper) {
        // sign the value of stepper to label and change it from double to Int then  String
        label.text = String(Int(sender.value))
        // sign the value if stepper to trackNumber and oddsNumber then  change it from double to Integer
        trackNumber = Int(sender.value)
        oddsNumber = Int(sender.value)
    }
    
    @IBAction func start(_ sender: Any) {
        if trackNumber >= 1 {
        implemetInput()
        } else {
            getResult()
        }
    }

    @IBAction func againButton(_ sender: Any) {
      drawAgain()
    }

    // MARK: Functions
    
    func drawAgain(){
        // enable button and change title to add
        stepper.isEnabled = true
        addButton.setTitle("add", for: .normal)
        // empty array and set varibales to first values
        arr = []
        trackNumber = 2
        randomNumber = 0
        oddsNumber = 2
        result.text = ""
        label.text = "2"
    }
    
    
    func implemetInput(){
        // check if textfield has value
        if let text = textField.text {
            // check if text is empty
            if text == "" {
                result.text = "Please add text"
            } else {
                // disable stepper button
                stepper.isEnabled = false
                // add value to array
                arr.append(text)
                // empty textfield to allow add another value
                textField.text = ""
                // decrease number to help us to change the title of button
                trackNumber -= 1
                // check if user finish add inputs to change the title of button
                if trackNumber >= 1 {
                    addButton.setTitle("add", for: .normal)
                } else {
                    addButton.setTitle("roll", for: .normal)
                }
            }
        }
    }
    
    func getResult(){
        randomNumber = Int(arc4random_uniform(UInt32(oddsNumber)))
        print(randomNumber)
        result.text = arr[randomNumber]
    }
    
    // MARK: Hidden Keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // the keyboard will disappear when user press return key
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // the keyboard will disappear when user press anywhere in screen
        self.view.endEditing(true)
    }

}

