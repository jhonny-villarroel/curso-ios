//
//  ViewController.swift
//  coreDataExaple
//
//  Created by test on 4/19/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

import UIKit
import CoreData


class ItemViewController: UIViewController {

    @IBOutlet weak var textFieldItem: UITextField!
    @IBOutlet weak var textFieldQuantity: UITextField!
    @IBOutlet weak var textFieldDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressSave(sender: AnyObject) {
        println("Save")
    // Reference to our app delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let contxt:NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("List", inManagedObjectContext: contxt)
        
        var newItem = List(entity:en!, insertIntoManagedObjectContext:contxt)
        newItem.item="testtttt"
        newItem.quantity="test2"
        newItem.info="test3"
        contxt.save(nil)
        println(newItem)
        
    // reference Moc
    // Create instance of pur data model and initialize
        // Map our properties
        // save our context
        // navigation back to root
        
    }

}

