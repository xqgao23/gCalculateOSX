//
//  ViewController.swift
//  gCaculateosx
//
//  Created by 高小强 on 15/11/9.
//  Copyright © 2015年 高小强. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var caculateValue: uint = 0
    var caculateValue2: uint = 0
    
    var bitButton = [NSButton]()
    var bitButton2 = [NSButton]()
    
    @IBOutlet weak var bit0Button: NSButton!
    @IBOutlet weak var bit1Button: NSButton!
    @IBOutlet weak var bit2Button: NSButton!
    @IBOutlet weak var bit3Button: NSButton!
    @IBOutlet weak var bit4Button: NSButton!
    @IBOutlet weak var bit5Button: NSButton!
    @IBOutlet weak var bit6Button: NSButton!
    @IBOutlet weak var bit7Button: NSButton!
    @IBOutlet weak var bit8Button: NSButton!
    @IBOutlet weak var bit9Button: NSButton!
    @IBOutlet weak var bit10Button: NSButton!
    @IBOutlet weak var bit11Button: NSButton!
    @IBOutlet weak var bit12Button: NSButton!
    @IBOutlet weak var bit13Button: NSButton!
    @IBOutlet weak var bit14Button: NSButton!
    @IBOutlet weak var bit15Button: NSButton!
    @IBOutlet weak var bit16Button: NSButton!
    @IBOutlet weak var bit17Button: NSButton!
    @IBOutlet weak var bit18Button: NSButton!
    @IBOutlet weak var bit20Button: NSButton!
    @IBOutlet weak var bit22Button: NSButton!
    @IBOutlet weak var bit26Button: NSButton!
    @IBOutlet weak var bit31Button: NSButton!
    @IBOutlet weak var bit30Button: NSButton!
    @IBOutlet weak var bit29Button: NSButton!
    @IBOutlet weak var bit28Button: NSButton!
    @IBOutlet weak var bit27Button: NSButton!
    @IBOutlet weak var bit25Button: NSButton!
    @IBOutlet weak var bit24Button: NSButton!
    @IBOutlet weak var bit23Button: NSButton!
    @IBOutlet weak var bit21Button: NSButton!
    @IBOutlet weak var bit19Button: NSButton!
    
    @IBOutlet weak var bit0Button2: NSButton!
    @IBOutlet weak var bit1Button2: NSButton!
    @IBOutlet weak var bit2Button2: NSButton!
    @IBOutlet weak var bit3Button2: NSButton!
    @IBOutlet weak var bit4Button2: NSButton!
    @IBOutlet weak var bit5Button2: NSButton!
    @IBOutlet weak var bit6Button2: NSButton!
    @IBOutlet weak var bit7Button2: NSButton!
    @IBOutlet weak var bit8Button2: NSButton!
    @IBOutlet weak var bit9Button2: NSButton!
    @IBOutlet weak var bit10Button2: NSButton!
    @IBOutlet weak var bit11Button2: NSButton!
    @IBOutlet weak var bit12Button2: NSButton!
    @IBOutlet weak var bit13Button2: NSButton!
    @IBOutlet weak var bit14Button2: NSButton!
    @IBOutlet weak var bit15Button2: NSButton!
    @IBOutlet weak var bit16Button2: NSButton!
    @IBOutlet weak var bit17Button2: NSButton!
    @IBOutlet weak var bit18Button2: NSButton!
    @IBOutlet weak var bit19Button2: NSButton!
    @IBOutlet weak var bit20Button2: NSButton!
    @IBOutlet weak var bit21Button2: NSButton!
    @IBOutlet weak var bit22Button2: NSButton!
    @IBOutlet weak var bit23Button2: NSButton!
    @IBOutlet weak var bit24Button2: NSButton!
    @IBOutlet weak var bit25Button2: NSButton!
    @IBOutlet weak var bit26Button2: NSButton!
    @IBOutlet weak var bit27Button2: NSButton!
    @IBOutlet weak var bit28Button2: NSButton!
    @IBOutlet weak var bit29Button2: NSButton!
    @IBOutlet weak var bit30Button2: NSButton!
    @IBOutlet weak var bit31Button2: NSButton!
    
    
    @IBOutlet weak var hexText1: NSTextField!
    @IBOutlet weak var octText1: NSTextField!
    @IBOutlet weak var decText1: NSTextField!
    
    @IBOutlet weak var hexText2: NSTextField!
    @IBOutlet weak var octText2: NSTextField!
    @IBOutlet weak var decText2: NSTextField!
    
    func updateUI() {
        for (index, ibutton) in bitButton.enumerate() {
            if (caculateValue & (uint(1) << uint(index)) != 0) {
                ibutton.state = NSOnState
            } else {
                ibutton.state = NSOffState
            }
        }
        
        for (index, ibutton) in bitButton2.enumerate() {
            if (caculateValue2 & (uint(1) << uint(index)) != 0) {
                ibutton.state = NSOnState
            } else {
                ibutton.state = NSOffState
            }
        }
        
        hexText1.stringValue = "".stringByAppendingFormat("%08X", caculateValue)
        octText1.stringValue = "".stringByAppendingFormat("%11O", caculateValue)
        decText1.stringValue = "".stringByAppendingFormat("%11U", caculateValue)
        
        hexText2.stringValue = "".stringByAppendingFormat("%08X", caculateValue2)
        octText2.stringValue = "".stringByAppendingFormat("%11O", caculateValue2)
        decText2.stringValue = "".stringByAppendingFormat("%11U", caculateValue2)
    }
    
    func textFieldHexEnter(text: NSTextField, index: Bool) {
        var value: uint = 0
        let scan = NSScanner.init(string: text.stringValue)
        
        switch text.identifier! {
        case "hex", "hex2":
            if scan.scanHexInt(&value) {
                if index {
                    caculateValue = value
                } else {
                    caculateValue2 = value
                }
            }
            break
        case "oct", "oct2":
            var error: Bool = false
            for c in text.stringValue.characters {
                if c <= "8" && c >= "0" {
                    value = value * 8 + uint((String(c) as NSString).integerValue - ("0" as NSString).integerValue)
                } else {
                    error = true
                    break
                }
            }
            
            if !error {
                if index {
                    caculateValue = value
                } else {
                    caculateValue2 = value
                }
            }
            
            break
        case "dec", "dec2":
            var newValue: Int64 = 0
            if scan.scanLongLong(&newValue) {
                if newValue > Int64(UINT32_MAX) {
                    newValue = Int64(UINT32_MAX)
                }
                
                if index {
                    caculateValue = uint(newValue)
                } else {
                    caculateValue2 = uint(newValue)
                }
            }
            break
        default:
            break
        }
        
        updateUI()
    }
    
    @IBAction func textEnterField1(sender: NSTextField) {
        textFieldHexEnter(sender, index: true)
    }
    
    @IBAction func textEnterField2(sender: NSTextField) {
        textFieldHexEnter(sender, index: false)
    }
    
    
    @IBAction func pressDown(sender: NSButton) {
        for (index, ibutton) in bitButton.enumerate() {
            if sender == ibutton {
                if (caculateValue & (uint(1) << uint(index)) != 0) {
                    caculateValue &= ~(uint(1) << uint(index))
                } else {
                    caculateValue |= uint(1) << uint(index)
                }
            }
        }
        
        for (index, ibutton) in bitButton2.enumerate() {
            if sender == ibutton {
                if (caculateValue2 & (uint(1) << uint(index)) != 0) {
                    caculateValue2 &= ~(uint(1) << uint(index))
                } else {
                    caculateValue2 |= uint(1) << uint(index)
                }
            }
        }
        
        updateUI()
    }
    
    func singleOp(button: NSButton, index: Bool) {
        var calculate = index ? caculateValue : caculateValue2
        let b31Button = index ? bit31Button : bit31Button2
        let b0Button = index ? bit0Button : bit0Button2
        
        switch button.title {
        case "<<":
            calculate = calculate << uint(1)
            break
        case ">>":
            calculate = calculate >> uint(1)
            break
        case "Shl":
            let bit0 = b31Button.state == NSOnState ? 1 : 0
            calculate = calculate << uint(1) | uint(bit0)
            break
        case "Shr":
            let bit31 = b0Button.state == NSOnState ? 1 : 0
            calculate = calculate >> uint(1) | uint(bit31) << 31
            break
        case "~":
            calculate = ~calculate
            break
        default:
            break
        }
        
        if index {
            caculateValue = calculate
        } else {
            caculateValue2 = calculate
        }
        
        updateUI()
        
        return
    }
    
    @IBAction func singleOpPress(sender: NSButton) {
        singleOp(sender, index: true)
    }
    
    @IBAction func singleOpPress2(sender: NSButton) {
        singleOp(sender, index: false)
    }
    
    @IBAction func doubleOpPress(sender: NSButton) {
        switch sender.title {
        case "AND":
            caculateValue = caculateValue & caculateValue2
            break
        case "OR":
            caculateValue = caculateValue | caculateValue2
            break
        case "XOR":
            caculateValue = caculateValue ^ caculateValue2
            break
        default:
            break
        }
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bitButton.append(bit0Button)
        bitButton.append(bit1Button)
        bitButton.append(bit2Button)
        bitButton.append(bit3Button)
        bitButton.append(bit4Button)
        bitButton.append(bit5Button)
        bitButton.append(bit6Button)
        bitButton.append(bit7Button)
        bitButton.append(bit8Button)
        bitButton.append(bit9Button)
        bitButton.append(bit10Button)
        bitButton.append(bit11Button)
        bitButton.append(bit12Button)
        bitButton.append(bit13Button)
        bitButton.append(bit14Button)
        bitButton.append(bit15Button)
        bitButton.append(bit16Button)
        bitButton.append(bit17Button)
        bitButton.append(bit18Button)
        bitButton.append(bit19Button)
        bitButton.append(bit20Button)
        bitButton.append(bit21Button)
        bitButton.append(bit22Button)
        bitButton.append(bit23Button)
        bitButton.append(bit24Button)
        bitButton.append(bit25Button)
        bitButton.append(bit26Button)
        bitButton.append(bit27Button)
        bitButton.append(bit28Button)
        bitButton.append(bit29Button)
        bitButton.append(bit30Button)
        bitButton.append(bit31Button)
        
        bitButton2.append(bit0Button2)
        bitButton2.append(bit1Button2)
        bitButton2.append(bit2Button2)
        bitButton2.append(bit3Button2)
        bitButton2.append(bit4Button2)
        bitButton2.append(bit5Button2)
        bitButton2.append(bit6Button2)
        bitButton2.append(bit7Button2)
        bitButton2.append(bit8Button2)
        bitButton2.append(bit9Button2)
        bitButton2.append(bit10Button2)
        bitButton2.append(bit11Button2)
        bitButton2.append(bit12Button2)
        bitButton2.append(bit13Button2)
        bitButton2.append(bit14Button2)
        bitButton2.append(bit15Button2)
        bitButton2.append(bit16Button2)
        bitButton2.append(bit17Button2)
        bitButton2.append(bit18Button2)
        bitButton2.append(bit19Button2)
        bitButton2.append(bit20Button2)
        bitButton2.append(bit21Button2)
        bitButton2.append(bit22Button2)
        bitButton2.append(bit23Button2)
        bitButton2.append(bit24Button2)
        bitButton2.append(bit25Button2)
        bitButton2.append(bit26Button2)
        bitButton2.append(bit27Button2)
        bitButton2.append(bit28Button2)
        bitButton2.append(bit29Button2)
        bitButton2.append(bit30Button2)
        bitButton2.append(bit31Button2)
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

