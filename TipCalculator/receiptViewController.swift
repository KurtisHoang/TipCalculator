//
//  receiptViewController.swift
//  TipCalculator
//
//  Created by Kurtis Hoang on 1/14/19.
//  Copyright © 2019 Kurtis Hoang. All rights reserved.
//

import UIKit

class receiptViewController: UIViewController {
    
    var amount: [Int] = [0, 0, 0, 0]
    
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var subTotal: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //get date and time
        getCurrentDateTime()
        //create label receipt of products
        productLabel.text = String(amount[0]) + "   burgers \t\t\t\t\t\t\t$8.99\n\n" + String(amount[1]) + "   Fries \t\t\t\t\t\t\t\t$3.40\n\n" + String(amount[2]) + "   Soda \t\t\t\t\t\t\t\t$1.75\n\n" + String(amount[3]) + "   Salad \t\t\t\t\t\t\t\t$6.99"
        productLabel.sizeToFit()
        //default stuff when view been loaded
        tipLabel.text = "10%"
        calculateSubtotal()
        calculateTotal(newTip: 0.10)
    }
    
    func getCurrentDateTime(){
        let formatter = DateFormatter()
        //set date and time style
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        //convert to string
        let str = formatter.string(from: Date())
        //set to label
        dateTime.text = str
    }
    
    @IBAction func tipChanged(_ sender: Any) {
        //change labels and calc total when switching segments
        switch tipControl.selectedSegmentIndex {
        case 0:
            tipLabel.text = "10%"
            calculateTotal(newTip: 0.10)
        case 1:
            tipLabel.text = "15%"
            calculateTotal(newTip: 0.15)
        case 2:
            tipLabel.text = "20%"
            calculateTotal(newTip: 0.20)
        default:
            break
        }
    }
    
    func calculateSubtotal()
    {
        var subtotal = (Double(amount[0]) * 8.99) + (Double(amount[1]) * 3.40) + (Double(amount[2]) * 1.75) + (Double(amount[3]) * 6.99)
        //rounded up two decimal places
        subtotal = round(subtotal * 100) / 100
        subTotal.text = String(subtotal)
    }
    
    func calculateTotal(newTip: Double)
    {
        let currTip = Double(subTotal.text!)! * newTip
        var addedTip = Double(subTotal.text!)! + currTip
        //rounded up two decimal places
        addedTip = round(addedTip * 100) / 100
        total.text = String(addedTip)
    }
}
