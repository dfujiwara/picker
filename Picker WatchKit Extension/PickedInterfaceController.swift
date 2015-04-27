//
//  PickedInterfaceController.swift
//  Picker
//
//  Created by Daisuke Fujiwara on 4/26/15.
//  Copyright (c) 2015 daisuke.com. All rights reserved.
//

import WatchKit
import Foundation


class PickedInterfaceController: WKInterfaceController {

    @IBOutlet weak var pickedElementLabel: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.setTitle("Done!")

        if let labelText = context as? String {
            pickedElementLabel.setText(labelText)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
}
