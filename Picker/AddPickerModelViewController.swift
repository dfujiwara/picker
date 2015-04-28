//
//  AddPickerModelViewController.swift
//  Picker
//
//  Created by Daisuke Fujiwara on 4/27/15.
//  Copyright (c) 2015 daisuke.com. All rights reserved.
//

import UIKit
import PickerModel

class AddPickerModelViewController: UIViewController {

    @IBOutlet weak var elementName: UITextField!

    var pickerModelStore: PickerModelStore

    init(pickerModelStore: PickerModelStore) {
        self.pickerModelStore = pickerModelStore
        super.init(nibName: "AddPickerModelViewController", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Add"
        self.configureBarButtons()
    }

    func configureBarButtons() {
        let leftBarButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain,
            target: self, action: "cancelButtonPressed:")
        self.navigationItem.leftBarButtonItem = leftBarButton

        let rightBarButton = UIBarButtonItem(title: "Finish", style: UIBarButtonItemStyle.Plain,
            target: self, action: "addButtonPressed:")
        self.navigationItem.rightBarButtonItem = rightBarButton
    }

    func addButtonPressed(sender: AnyObject) {
        if elementName.text.isEmpty {
           return
        }
        self.pickerModelStore.addNewElement(elementName.text)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
