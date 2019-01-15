//
//  ViewController.swift
//  TipCalculator
//
//  Created by Kurtis Hoang on 1/14/19.
//  Copyright © 2019 Kurtis Hoang. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    var amount: [Int] = [0, 0, 0, 0]
    
    @IBOutlet weak var shirtAmt: UILabel!
    @IBOutlet weak var jeansAmt: UILabel!
    @IBOutlet weak var hatAmt: UILabel!
    @IBOutlet weak var shoesAmt: UILabel!
    
    @IBOutlet weak var proceedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //round out the corner of the proceed button
        proceedButton.layer.cornerRadius = 15
        proceedButton.clipsToBounds = true
    }
    
    @IBAction func shirtIncrement(_ sender: Any) {
        incrementNum(i: 0)
        shirtAmt.text = String(amount[0])
    }
    
    @IBAction func shirtDecrement(_ sender: Any) {
        decrementNum(i: 0)
        shirtAmt.text = String(amount[0])
    }
    
    @IBAction func jeansIncrement(_ sender: Any) {
        incrementNum(i: 1)
        jeansAmt.text = String(amount[1])
    }
    
    @IBAction func jeansDecrement(_ sender: Any) {
        decrementNum(i: 1)
        jeansAmt.text = String(amount[1])
    }
    
    @IBAction func hatIncrement(_ sender: Any) {
        incrementNum(i: 2)
        hatAmt.text = String(amount[2])
    }
    
    @IBAction func hatDecrement(_ sender: Any) {
        incrementNum(i: 2)
        hatAmt.text = String(amount[2])
    }
    
    @IBAction func shoesIncrement(_ sender: Any) {
        incrementNum(i: 3)
        shoesAmt.text = String(amount[3])
    }
    
    @IBAction func shoesDecrement(_ sender: Any) {
        decrementNum(i: 3)
        shoesAmt.text = String(amount[3])
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "proceedSegue"
        {
            if let destination = segue.destination as? receiptViewController
            {
                destination.amount = amount
            }
        }
    }
    
    @IBAction func proceedButton(_ sender: Any) {
        performSegue(withIdentifier: "proceedSegue", sender: self)
    }
}

