//
//  TableViewController.swift
//  OuttaTimeSwift
//
//  Created by Komari Herring on 8/15/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
   
    
        
        var delegate:TableViewControllerDelegate?
        
        @IBOutlet weak var setDatePicker: UIDatePicker!
        
        let dateFormatter = NSDateFormatter()
        
        override func viewDidLoad()
        {
            super.viewDidLoad()
            
        
        }
        
        override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
            
        }
        
        //wouldn't let me connect buttons to picker for some reason - going back to finish 
        
        @IBAction func setTapped(sender: UIButton)
        {
            
            
            delegate!.didFinishTask(setDatePicker.date)
            
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        @IBAction func cancelTapped(sender: UIButton)
        {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        
}
