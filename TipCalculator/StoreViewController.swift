//
//  ViewController.swift
//  TipCalculator
//
//  Created by Kurtis Hoang on 1/14/19.
//  Copyright © 2019 Kurtis Hoang. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UITextFieldDelegate {
    
    var amount: [Int] = [0, 0, 0, 0, 0]
    
    @IBOutlet weak var burgerAmt: UILabel!
    @IBOutlet weak var friesAmt: UILabel!
    @IBOutlet weak var sodaAmt: UILabel!
    @IBOutlet weak var saladAmt: UILabel!
    @IBOutlet weak var extrasAmt: UILabel!
    @IBOutlet weak var extras: UITextField!
    
    @IBOutlet weak var proceedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //round out the corner of the proceed button
        proceedButton.layer.cornerRadius = 15
        proceedButton.clipsToBounds = true
        
        //listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        //stop listening for keyboard show/hide events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @IBAction func burgerIncrement(_ sender: Any) {
        incrementNum(i: 0)
        burgerAmt.text = String(amount[0])
    }
    
    @IBAction func burgerDecrement(_ sender: Any) {
        decrementNum(i: 0)
        burgerAmt.text = String(amount[0])
    }
    
    @IBAction func friesIncrement(_ sender: Any) {
        incrementNum(i: 1)
        friesAmt.text = String(amount[1])
    }
    
    @IBAction func friesDecrement(_ sender: Any) {
        decrementNum(i: 1)
        friesAmt.text = String(amount[1])
    }
    
    @IBAction func sodaIncrement(_ sender: Any) {
        incrementNum(i: 2)
        sodaAmt.text = String(amount[2])
    }
    
    @IBAction func sodaDecrement(_ sender: Any) {
        decrementNum(i: 2)
        sodaAmt.text = String(amount[2])
    }
    
    @IBAction func saladIncrement(_ sender: Any) {
        incrementNum(i: 3)
        saladAmt.text = String(amount[3])
    }
    
    @IBAction func saladDecrement(_ sender: Any) {
        decrementNum(i: 3)
        saladAmt.text = String(amount[3])
    }
    
    @IBAction func extrasIncrement(_ sender: Any) {
        incrementNum(i: 4)
        extrasAmt.text = String(amount[4])
    }
    
    @IBAction func extrasDecrement(_ sender: Any) {
        decrementNum(i: 4)
        extrasAmt.text = String(amount[4])
    }
    
    func incrementNum(i: Int)
    {
        if(!(amount[i] >= 10))
        {
            amount[i] += 1
        }
    }
    
    func decrementNum(i: Int)
    {
        if(!(amount[i] <= 0))
        {
            amount[i] -= 1
        }
    }
    
    @IBAction func inputEnded(_ sender: Any) {
        if(extras.text == "")
        {
            extras.text = "0.00"
        }
    }
    
    @objc func keyboardWillChange(notification: Notification)
    {
        //show notification of keyboard events
        //print("keyboard will show: \(notification.name.rawValue)")
        
        //get keyboardRect
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if(notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification)
        {
            //move view up
            view.frame.origin.y = -keyboardRect.height
        }
        else
        {
            //move view up
            view.frame.origin.y = 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "proceedSegue"
        {
            if let destination = segue.destination as? receiptViewController
            {
                destination.amount = amount
                destination.extras = extras.text
            }
        }
    }
    
    @IBAction func proceedButton(_ sender: Any) {
        performSegue(withIdentifier: "proceedSegue", sender: self)
    }
}

