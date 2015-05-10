//
//  GlanceController.swift
//  Picker
//
//  Created by Daisuke Fujiwara on 5/9/15.
//  Copyright (c) 2015 daisuke.com. All rights reserved.
//

import WatchKit
import PickerModel

class GlanceController: WKInterfaceController {
    @IBOutlet weak var glanceTitle: WKInterfaceLabel!
    @IBOutlet weak var pickedElementLabel: WKInterfaceLabel!

    override func willActivate() {
        let pickerModelStore = PickerModelStore()
        let (index, randomlySelectedElement) = pickerModelStore.randomSelect()
        if let randomlySelectedElement = randomlySelectedElement {
            pickedElementLabel.setText(randomlySelectedElement.label)
        } else {
            pickedElementLabel.setText("None selected")
        }
    }
}