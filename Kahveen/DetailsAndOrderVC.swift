//
//  DetailsAndOrderVC.swift
//  Kahveen
//
//  Created by Burak Altunoluk on 21/05/2023.
//

import UIKit

class DetailsAndOrderVC: UIViewController {

    var kg = 1
    var unitPrice = 10
    var typeOfRoasting = "Light"
    var whichCoffee = "Brazil Santozz"
    var cardOrCash = "Cash"
    var total = 0
    
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var coffeeBagImage: UIImageView!
    @IBOutlet weak var coffeeTitleLabel: UILabel!
    @IBOutlet weak var roastingType: UILabel!
    @IBOutlet weak var detailsText: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var roastTypeSegmentController: UISegmentedControl!
    @IBOutlet weak var kgSegmentedController: UISegmentedControl!
    @IBOutlet weak var allOrderLabel: UILabel!
    @IBOutlet weak var orderItButtonOutlet: UIButton!
    @IBOutlet weak var cashOrCardSegmentedController: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goback))
        priceLabel.text = "£\(unitPrice)/kg"
        titleImage.addGestureRecognizer(gesture)
    }
    @IBAction func roastOfTypeSegmentControllerPressed(_ sender: UISegmentedControl) {
        switch roastTypeSegmentController.selectedSegmentIndex {
            
                case 0: typeOfRoasting = "Light"
                        roastingType.text = "Light"
                  
                case 1 : typeOfRoasting = "Medium"
                         roastingType.text = "Medium"
                  
                case 2: typeOfRoasting = "Dark"
                        roastingType.text = "Dark"
             
                default:
                    break
                }
        self.allOrderLabel.text = "\(kg) Kg - \(whichCoffee) (\(typeOfRoasting))"
        orderItButtonOutlet.setTitle("£\(total) order", for: .normal)
    }
    
    @IBAction func kgSegmentedControllerPressed(_ sender: UISegmentedControl) {
        switch kgSegmentedController.selectedSegmentIndex {
        case 0 : kg = 1; total = 1 * unitPrice
        case 1 : kg = 5;  total = 5 * unitPrice
        case 2 : kg = 10; total = 10 * unitPrice
        case 3 : kg = 15; total = 15 * unitPrice
        case 4 : kg = 20; total = 20 * unitPrice
        
        default:
            break
        }
        self.allOrderLabel.text = "\(kg) Kg - \(whichCoffee) (\(typeOfRoasting))"
        
        orderItButtonOutlet.setTitle("£\(total) order", for: .normal)
        
    }
    
    @IBAction func cashOrCardSegmentedPressed(_ sender: UISegmentedControl) {
        
        switch cashOrCardSegmentedController.selectedSegmentIndex {
            
        case 0 : cardOrCash = "Cash"
        case 1 : cardOrCash = "Card"
        
        default:
            break
        }
        
    }
    
    
    
    @IBAction func orderItButton(_ sender: Any) {
        print("\(allOrderLabel.text ?? "") - \(cardOrCash) - £\(total)")
        dismiss(animated: true)
        
    }
    
    
    @objc func goback() {
        dismiss(animated: true)
    }



}
