//
//  NewViewController.swift
//  Observer and Notification
//
//  Created by iim jobs on 14/02/20.
//  Copyright © 2020 iim jobs. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    
    func showToast(controller: UIViewController, message: String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func button(_ sender: Any) {
        if(!textFieldOne.text!.isEmpty && !textFieldTwo.text!.isEmpty) {
            let name = Notification.Name(rawValue: oneNotificationKey)
            NotificationCenter.default.post(name: name, object: NotificationObject(message: textFieldOne.text!))
            
            let name2 = Notification.Name(rawValue: twoNotificationKey)
            NotificationCenter.default.post(name: name2, object: NotificationObject(message: textFieldTwo.text!))
            
            dismiss(animated: true, completion: nil)
        }
        else {
            showToast(controller: self, message: "Fill above fields!", seconds: 3.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
