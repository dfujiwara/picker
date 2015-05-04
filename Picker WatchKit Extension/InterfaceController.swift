//
//  InterfaceController.swift
//  Picker WatchKit Extension
//
//  Created by Daisuke Fujiwara on 4/26/15.
//  Copyright (c) 2015 daisuke.com. All rights reserved.
//

import WatchKit
import Foundation
import PickerModel

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var tableView: WKInterfaceTable!
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        if segueIdentifier != "PickerSelection" {
            return nil
        }

        let pickerModelStore = PickerModelStore()
        let (index, pickerModel) = pickerModelStore.randomSelect()
        if let index = index, model = pickerModel {
            return model.label
        } else {
            return nil
        }
    }

    override func awakeWithContext(context: AnyObject?) {
        let pickerModelStore = PickerModelStore()
        let elements = pickerModelStore.elements
        tableView.setNumberOfRows(elements.count, withRowType: "PickerRowType")

        for (i, element) in enumerate(elements) {
            let controller = tableView.rowControllerAtIndex(i) as! PickerRowController
            controller.textLabel.setText(element.label)
        }
    }
}
