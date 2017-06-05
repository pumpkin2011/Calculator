//
//  ViewController.swift
//  Calculator
//
//  Created by Aico on 6/3/17.
//  Copyright © 2017 lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
       
    }
    
    @IBAction func operate(_ sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(symbol: operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(operand: displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    
    }
    
    var displayValue: Double {
        get {
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

