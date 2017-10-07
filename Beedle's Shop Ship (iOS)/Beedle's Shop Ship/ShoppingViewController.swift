//
//  ShoppingViewController.swift
//  Beedle's Shop Ship
//
//  Created by Marc Hosecloth on 5/1/17.
//  Copyright © 2017 Marc Hosecloth. All rights reserved.
//

import UIKit

struct cellData {
    let itemIcon : UIImage!
    let itemName : String!
    let itemPriceTag : String!
    let itemPrice : Int!
    var itemQuantity : Int!
}

class ShoppingViewController : UITableViewController {
    
    var cellDataArr = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cellDataArr = [cellData(itemIcon : #imageLiteral(resourceName: "allpurposebait"), itemName : "All-Purpose Bait", itemPriceTag : "30 Rupees", itemPrice: 30,  itemQuantity : 0),
                       cellData(itemIcon : #imageLiteral(resourceName: "arrow"), itemName : "Arrows (10)", itemPriceTag : "30 Rupees", itemPrice: 30, itemQuantity : 0),
                       cellData(itemIcon : #imageLiteral(resourceName: "baitbag"), itemName : "Bait Bag", itemPriceTag : "20 Rupees", itemPrice: 20, itemQuantity : 0),
                       cellData(itemIcon : #imageLiteral(resourceName: "bomb"), itemName : "Bombs (15)", itemPriceTag : "50 Rupees", itemPrice: 50, itemQuantity : 0),
                       cellData(itemIcon : #imageLiteral(resourceName: "emptybottle"), itemName : "Empty Bottle", itemPriceTag : "500 Rupees", itemPrice: 500, itemQuantity : 0),
                       cellData(itemIcon : #imageLiteral(resourceName: "hyoipear"), itemName : "Hyoi Pear", itemPriceTag : "10 Rupees", itemPrice: 10, itemQuantity : 0),
                       cellData(itemIcon : #imageLiteral(resourceName: "pieceofheart"), itemName : "Piece of Heart", itemPriceTag : "950 Rupees", itemPrice: 950, itemQuantity : 0),
                       cellData(itemIcon : #imageLiteral(resourceName: "redpotion"), itemName : "Red Poition", itemPriceTag : "30 Rupees", itemPrice: 30, itemQuantity : 0),
                       cellData(itemIcon : #imageLiteral(resourceName: "treasurechart"), itemName : "Treasure Chart", itemPriceTag : "900 Rupees", itemPrice: 900, itemQuantity : 0)]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        cell.tag = indexPath.row
        cell.itemIconImageView.image = cellDataArr[indexPath.row].itemIcon
        cell.itemNameLabel.text = cellDataArr[indexPath.row].itemName
        cell.itemPriceTagLabel.text = cellDataArr[indexPath.row].itemPriceTag
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : CheckoutViewController = segue.destination as! CheckoutViewController
        
        getItemQuantities()
        
        destination.cellDataArr = cellDataArr
    }
    
    func getItemQuantities() {
        for i in 0..<cellDataArr.count {
            
            // add input validation later for completeness
            
            let quantity : Int = Int(TextFieldModel.sharedModel.textFieldData[i])!
            
            if quantity > 0 {
                cellDataArr[i].itemQuantity = quantity
            }
        }
        
        print("\nIn Shopping view controller...")
        
        for i in 0..<cellDataArr.count {
            print("Quantity of item \(i): \(cellDataArr[i].itemQuantity)")
        }
    }
}

class TextFieldModel {
    static let sharedModel = TextFieldModel()
    var textFieldData : [String] = ["0", "0", "0", "0", "0", "0", "0", "0", "0"]
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemIconImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceTagLabel: UILabel!
    @IBOutlet weak var itemQuantityTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemQuantityTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        TextFieldModel.sharedModel.textFieldData[tag] = textField.text!
    }
}
