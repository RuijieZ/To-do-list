//
//  FirstViewController.swift
//  To Do List2
//
//  Created by Ruijie Zhang on 2015-07-25.
//  Copyright (c) 2015 Ruijie Zhang. All rights reserved.
//

import UIKit

var toDoListArrayOfStrings = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var toDoListTable: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return toDoListArrayOfStrings.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoListArrayOfStrings[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList" ) != nil)
        {
        toDoListArrayOfStrings = NSUserDefaults.standardUserDefaults().objectForKey("toDoList" ) as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
           toDoListArrayOfStrings.removeAtIndex(indexPath.row)
           NSUserDefaults.standardUserDefaults().setObject(toDoListArrayOfStrings, forKey: "toDoList")
           toDoListTable.reloadData()
        }
    }

    override func viewDidAppear(animated: Bool)
    {
        toDoListTable.reloadData()
    }
}

