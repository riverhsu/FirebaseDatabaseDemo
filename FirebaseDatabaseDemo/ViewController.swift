//
//  ViewController.swift
//  FirebaseDatabaseDemo
//
//  Created by Sgmedical on 2016/10/26.
//  Copyright © 2016年 Sgmedical. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    //Connect to real time Firebase database reference
    // real time database is JSON document tree
    //let rootRef = FIRDatabase.database().reference()
    
    //Sample JSON structure :
    // Root/condition/sunny
    // Root/condition/foggy
    // Now listen to or observe database changes
    //let conditionRef = rootRef.child("condition")
    
    let conditionRef = FIRDatabase.database().reference().child("condition")
    
    @IBOutlet weak var conditionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

        //conditionRef.observeEventType(eventType: FIRDataEventType, withBlock: (FIRDataSnapshot) -> Void)
        conditionRef.observe(FIRDataEventType.value){ (snap: FIRDataSnapshot) in
            self.conditionLabel.text = snap.value as? String
                            
        }
    }

    @IBAction func sunnyDidTouch(_ sender: AnyObject) {
        //因為JSON是目錄結構，所以 conditionRef 是指向 condition，設定它的值
        conditionRef.setValue("Sunny")
    }
    
    @IBAction func foggyDidTouch(_ sender: AnyObject) {
        conditionRef.setValue("Foggy")
    }
    
}

