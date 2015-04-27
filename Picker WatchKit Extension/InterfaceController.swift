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
}
