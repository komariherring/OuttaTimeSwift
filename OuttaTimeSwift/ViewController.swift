//
//  ViewController.swift
//  OuttaTimeSwift
//
//  Created by Komari Herring on 8/15/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

protocol TableViewControllerDelegate
{
    func didFinishTask(dateToSet: NSDate)
}


class ConsoleDisplayViewController: UIViewController, TableViewControllerDelegate
{
    
    var currentSpeed: NSTimer?
    
    var originalSpeed: Int = 0
    
    var speedTimer: Int = 0
    
    let dateFormatter = NSDateFormatter()
    
    @IBOutlet weak var destinationLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
  
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .MediumStyle
        
        dateFormatter.timeStyle = .NoStyle
        
        let currentDate = NSDate()
        
        presentTimeLabel.text = dateFormatter.stringFromDate (currentDate)
        
        destinationLabel.text = "Choose a date"
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func travelBackTapped(sender: UIButton)
    {
        
        speedTimer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector:
            
            #selector(ConsoleDisplayViewController.travelBackFired), userInfo: nil, repeats: true)
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "SetDestinationSegue"
        {
            let setDateVC = segue.destinationViewController as! TableViewController
            
            setDateVC.delegate = self
        }
    }
    
    func didFinishTask(dateToSet: NSDate)
    {
        destinationLabel.text = dateFormatter.stringFromDate (dateToSet)
        
    }
    
    func travelBackFired()
    {
        
        if (originalSpeed < 88)
        {
            originalSpeed = originalSpeed + 1
            
            speedLabel.text = "\(originalSpeed) MPH"
        }
        else
        {
            speedTimer? = ////???
            
            originalSpeed = 0
            
            speedLabel.text = "0 MPH"
            
            lastTimeLabel.text = presentTimeLabel.text
            
            presentTimeLabel.text = destinationLabel.text
            
            destinationLabel.text = "Pick a date!"
        }
    }
    
    
    
}
