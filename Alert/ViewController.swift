//
//  ViewController.swift
//  Alert
//
//  Created by Masaki Horimoto on 2015/09/10.
//  Copyright (c) 2015年 Masaki Horimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressAlertButton(sender: AnyObject) {
        
        let iOSVersion: NSString! = UIDevice.currentDevice().systemVersion as NSString
        println("iOSVersion is \(iOSVersion)")
        
        //iOS Verによってアラート動作を変える
        if iOSVersion.floatValue < 8.0 { self.showAlertIOS7() }
        else { self.showAlertIOS8() }
        
    }
    
    func showAlertIOS8() {
        
        // Style Alert
        let alert: UIAlertController = UIAlertController(title:"alert",
            message: "alertController",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        
        // Cancel 一つだけしか指定できない
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler:{
                (action:UIAlertAction!) -> Void in
                println("Cancel")
        })
        
        // Default 複数指定可
        let defaultAction: UIAlertAction = UIAlertAction(title: "Default",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                println("Default")
        })
        
        // Destructive 複数指定可
        let destructiveAction: UIAlertAction = UIAlertAction(title: "Destructive",
            style: UIAlertActionStyle.Destructive,
            handler:{
                (action:UIAlertAction!) -> Void in
                println("Destructive")
        })
        
        // AddAction 記述順に反映される
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        alert.addAction(destructiveAction)
        
        // Display
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func showAlertIOS7() {
        let alert = UIAlertView()
        alert.title = "alert"
        alert.message = "alertController"
        alert.addButtonWithTitle("Default")
        alert.addButtonWithTitle("Destructive")
        alert.addButtonWithTitle("Cancel")
        alert.show();
    }

}

