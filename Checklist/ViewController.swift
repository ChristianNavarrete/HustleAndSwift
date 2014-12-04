//
//  ViewController.swift
//  Checklist
//
//  Created by HoodsDream on 12/3/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    
    var tableView: UITableView!
    var textField: UITextField!
    var tableViewData = ["Shit D Jay, now Im just payin' rent", "Whoop that trick, get em"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize  Table View
        
        self.tableView = UITableView(frame: CGRectMake(0,100, self.view.bounds.width, self.view.bounds.height-100), style: UITableViewStyle.Plain)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 75.0
        self.view.addSubview(self.tableView)
        
        //initialize textField
        
        self.textField = UITextField(frame: CGRectMake(0, 0, self.view.bounds.size.width, 100))
        self.textField.backgroundColor = UIColor.orangeColor()
        self.textField.delegate = self
        self.textField.text = "Enter a line from Hustle and Flow here mayne"
        self.view.addSubview(self.textField)
        
    }
    
    //Table View Data Source Delegate

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableViewData.count
        
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let myNewCell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        
        myNewCell.textLabel.text = self.tableViewData[indexPath.row]
        
        myNewCell.contentView.sizeToFit()
        
        return myNewCell
        
        
        
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        tableViewData.append(textField.text)
        textField.text = ""
        self.tableView.reloadData()
        textField.resignFirstResponder()
        
        return true
    }

}

