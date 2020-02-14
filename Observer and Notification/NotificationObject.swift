//
//  NotificationObject.swift
//  Observer and Notification
//
//  Created by iim jobs on 14/02/20.
//  Copyright © 2020 iim jobs. All rights reserved.
//

import UIKit

class NotificationObject: NSObject {
    var message: String = ""
    
    init(message: String) {
        self.message = message
    }
}
