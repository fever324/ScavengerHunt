//
//  ViewController.swift
//  ScavengerHunt
//
//  Created by Hongfei Li on 9/18/14.
//  Copyright (c) 2014 Hongfei Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var createdItem: ScavengerHuntItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = textField.text {
                if !name.isEmpty {
                    createdItem = ScavengerHuntItem(name: name)
                }
            }
        }
    }


}

