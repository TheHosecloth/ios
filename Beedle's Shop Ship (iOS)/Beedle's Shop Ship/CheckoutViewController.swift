//
//  CheckoutViewController.swift
//  Beedle's Shop Ship
//
//  Created by Marc Hosecloth on 5/1/17.
//  Copyright © 2017 Marc Hosecloth. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    @IBOutlet weak var shoppingCartReceiptLabel: UILabel!
    
    var cellDataArr = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        print("\nIn checkout view controller...")
//        
//        for i in 0..<cellDataArr.count {
//            print("Quantity of item \(i): \(cellDataArr[i].itemQuantity)")
//        }
        
        shoppingCartReceiptLabel.text = generateShoppingCartReceipt()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateShoppingCartReceipt() -> String {
        var receipt = "Your current shopping cart is below, please check over everything before submitting your order.\n\n"
        var totalCost = 0
    
        for i in 0..<cellDataArr.count {
            if cellDataArr[i].itemQuantity > 0 {
                receipt.append("\(cellDataArr[i].itemQuantity!) \(cellDataArr[i].itemName!) - \(cellDataArr[i].itemQuantity * cellDataArr[i].itemPrice) Rupees\n")
                totalCost += cellDataArr[i].itemQuantity * cellDataArr[i].itemPrice
            }
        }
        
        receipt.append("\nTotal: \(totalCost) Rupees")
        
        return receipt
    }
}
