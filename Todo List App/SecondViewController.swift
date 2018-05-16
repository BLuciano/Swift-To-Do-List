//
//  SecondViewController.swift
//  Todo List App
//
//  Created by Luciano Bruzzoni on 5/13/18.
//  Copyright © 2018 Luciano Bruzzoni. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var listItem: UITextField!
    
    var listArry:[String] = []
    
    @IBAction func addItem(_ sender: Any) {
        if let item = listItem.text, !item.isEmpty{
            if let tempArry = UserDefaults.standard.object(forKey: "list") as? [String]{
                listArry = tempArry
            }
    
            listArry.append(item)
            UserDefaults.standard.set(listArry, forKey: "list")
            listItem.text = ""
            message.text = "Item added!"
        } else {
            message.text = "Please write down an item"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

