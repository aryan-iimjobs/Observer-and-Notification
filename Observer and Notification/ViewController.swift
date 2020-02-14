//
//  ViewController.swift
//  Observer and Notification
//
//  Created by iim jobs on 14/02/20.
//  Copyright © 2020 iim jobs. All rights reserved.
//

import UIKit

let oneNotificationKey = "com.iimjobs.one"
let twoNotificationKey = "com.iimjobs.two"

class ViewController: UIViewController {

    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    
    let oneNotif = Notification.Name(rawValue: oneNotificationKey)
    let twoNotif = Notification.Name(rawValue: twoNotificationKey)
    
    @IBAction func buttonClick(_ sender: Any) {
        let newVc = storyboard?.instantiateViewController(identifier: "NewViewController")
        present(newVc!,animated: true,completion: nil)
    }
    
    func createObservers() {
        //One
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateLabelOne(notification:)), name: oneNotif, object: nil)
        
        //two
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateLabelTwo(notification:)), name: twoNotif, object: nil)
    }
    
    @objc func updateLabelOne(notification: NSNotification) {
        let obj = notification.object as! NotificationObject
        labelOne.text = obj.message
    }
    
    @objc func updateLabelTwo(notification: NSNotification) {
        let obj = notification.object as! NotificationObject
        labelTwo.text = obj.message
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }
}

