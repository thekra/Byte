//
//  ViewController.swift
//  Byte
//
//  Created by Thekra Abuhaimed. on 22/02/1442 AH.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
   
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textF: UITextField!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var binary: UILabel!
    
    var num: UInt = 0
    var b = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textF.delegate = self
        setupUI()
        b = ["0","0","0","0","0","0","0","0"]
    }
    
    func setupUI() {
        setupLabels(label, radius: 20, true)
        setupLabels(colorLabel, radius: 20, true)
        textF.layer.cornerRadius = 15
    }
    
    func setupLabels(_ label: UILabel, radius: Int, _ flag: Bool) {
        label.layer.cornerRadius = 20
        label.layer.masksToBounds = true
    }
    
    @IBAction func switches(_ sender: UISwitch) {
        switch sender.tag {
        case 0:
            if sender.isOn {
                cal(1, "+", pos: 7)
            } else {
                cal(1, "-", pos: 7)
            }
            
        case 1:
            if sender.isOn {
                cal(2, "+", pos: 6)
            } else {
                cal(2, "-", pos: 6)
            }
            
        case 2:
            if sender.isOn {
                cal(4, "+", pos: 5)
            } else {
                cal(4, "-", pos: 5)
            }
            
        case 3:
            if sender.isOn {
                cal(8, "+", pos: 4)
                
            } else {
                cal(8, "-", pos: 4)
            }
            
        case 4:
            if sender.isOn {
                cal(16, "+", pos: 3)
            } else {
                cal(16, "-", pos: 3)
            }
            
        case 5:
            if sender.isOn {
                cal(32, "+", pos: 2)
            } else {
                cal(32, "-", pos: 2)
            }
            
        case 6:
            if sender.isOn {
                cal(64, "+", pos: 1)
            } else {
                cal(64, "-", pos: 1)
            }
            
        case 7:
            if sender.isOn {
                cal(128, "+", pos: 0)
            } else {
                cal(128, "-", pos: 0)
            }
            
        default:
            return
        }
    }
    
    func cal(_ power: UInt, _ operation: String, pos: Int) {
        
        if operation == "+" {
            
            num = num | power
            b.remove(at: pos)
            b.insert("1", at: pos)
            binary.text = b.joined()
            
        } else if operation == "-" {
            
            num = num & (~power)
            b.remove(at: pos)
            b.insert("0", at: pos)
            binary.text = b.joined()
        }
        
        label.text = "\(Int(num))"
        
        if textF.text == label.text {
            colorLabel.backgroundColor? = #colorLiteral(red: 0.4319985211, green: 0.6707134247, blue: 0.366594553, alpha: 1)
        }
        else {
            colorLabel.backgroundColor = .systemGray5
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == label.text {
            colorLabel.backgroundColor? = #colorLiteral(red: 0.4319985211, green: 0.6707134247, blue: 0.366594553, alpha: 1)
        }
        else {
            colorLabel.backgroundColor = .systemGray5
        }
    }
}
