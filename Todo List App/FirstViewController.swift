//
//  FirstViewController.swift
//  Todo List App
//
//  Created by Luciano Bruzzoni on 5/13/18.
//  Copyright © 2018 Luciano Bruzzoni. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var listArry:[String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArry.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "List" )
        
        cell.textLabel?.text = String(listArry[indexPath.row])
        
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Remove to slide list items
    internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            listArry.remove(at: indexPath.row)
            UserDefaults.standard.set(listArry, forKey: "list")
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let tempArry = UserDefaults.standard.array(forKey: "list") as? [String]{
            listArry = tempArry
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

