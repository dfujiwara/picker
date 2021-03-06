//
//  ViewController.swift
//  Picker
//
//  Created by Daisuke Fujiwara on 4/26/15.
//  Copyright (c) 2015 daisuke.com. All rights reserved.
//

import UIKit
import PickerModel

class ViewController: UIViewController {
    let reuseIdentifier = "Reuse"
    let pickerModelStore: PickerModelStore
    var tableView: UITableView?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        pickerModelStore = PickerModelStore()
        super.init(nibName: nil, bundle: nil)
        self.commonInit()
    }

    required init(coder aDecoder: NSCoder) {
        pickerModelStore = PickerModelStore()
        super.init(coder: aDecoder)
        self.commonInit()
    }

    func commonInit() {
        self.edgesForExtendedLayout = UIRectEdge.None
        self.extendedLayoutIncludesOpaqueBars = false
        self.navigationItem.title = "Picker"
        self.configureBarButtons()
    }

    func configureBarButtons() {
        let leftBarButton = UIBarButtonItem(title: "Pick!", style: UIBarButtonItemStyle.Plain,
            target: self, action: "pickButtonPressed:")
        self.navigationItem.leftBarButtonItem = leftBarButton

        let rightBarButton = UIBarButtonItem(title: "Add!", style: UIBarButtonItemStyle.Plain,
            target: self, action: "addButtonPressed:")
        self.navigationItem.rightBarButtonItem = rightBarButton
    }

    override func loadView() {
        tableView = UITableView(frame: CGRectZero)
        tableView!.dataSource = self
        tableView!.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: reuseIdentifier)
        self.view = tableView!
    }

    override func viewWillAppear(animated: Bool) {
        tableView?.reloadData()
    }
}

extension ViewController: UITableViewDataSource {

    func getElement(indexPath: NSIndexPath) -> PickerModel {
        let elements = pickerModelStore.elements
        let element = elements[indexPath.row]
        return element
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickerModelStore.elements.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier,
            forIndexPath: indexPath) as! UITableViewCell
        let element = self.getElement(indexPath)
        cell.textLabel!.text = element.label
        return cell
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            if editingStyle != .Delete {
                return
            }
            let element = self.getElement(indexPath)
            pickerModelStore.removeElement(element)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
}

extension ViewController {
    func pickButtonPressed(sender: AnyObject) {
        let (index, randomElement) = pickerModelStore.randomSelect()
        if let index = index, element = randomElement {
            println("Picked \(element.label)")
            tableView?.selectRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0),
                animated: true, scrollPosition: UITableViewScrollPosition.None)
        }
    }

    func addButtonPressed(sender: AnyObject) {
        //let viewController = AddPickerModelViewController(nibName:"AddPickerModelViewController", bundle: nil)
        let viewController = AddPickerModelViewController(pickerModelStore: self.pickerModelStore)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
}