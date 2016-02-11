//
//  SecondViewController.swift
//  To Do List2
//
//  Created by Ruijie Zhang on 2015-07-25.
//  Copyright (c) 2015 Ruijie Zhang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var enterAnItemTextBox: UITextField!
    
    @IBAction func addAnItemButtonClicked(sender: AnyObject) {
        
        var itemToBeAdded = String(enterAnItemTextBox.text)
        
        if itemToBeAdded != ""
        {
            toDoListArrayOfStrings.append(itemToBeAdded)
            NSUserDefaults.standardUserDefaults().setObject(toDoListArrayOfStrings, forKey: "toDoList")
        }
        enterAnItemTextBox.text = ""
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.enterAnItemTextBox.delegate! = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        // this function makes sure the keyboard is hidden after entering return
        enterAnItemTextBox.resignFirstResponder()
        return true
    }

}

