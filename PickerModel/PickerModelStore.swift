//
//  PickerModelStore.swift
//  Picker
//
//  Created by Daisuke Fujiwara on 4/26/15.
//  Copyright (c) 2015 daisuke.com. All rights reserved.
//

import Foundation

public class PickerModelStore {
    var _elements: [PickerModel]

    public var elements: [PickerModel] {
        get {
            return _elements
        }
    }

    public init() {
        var people: [PickerModel] = []
        for (index, element) in enumerate(["Sophie", "Grant", "Abhijeet", "Wes", "Jin", "Mitali"]) {
            let model = PickerModel(id: index, label: element)
            people.append(model)
        }
        _elements = people
    }

    public func randomSelect() -> (Int?, PickerModel?) {
        if elements.isEmpty {
           return (nil, nil)
        }
        let randomIndex = Int(arc4random_uniform(UInt32(elements.count)))
        return (randomIndex, elements[randomIndex])
    }

    public func addNewElement(elementName: String) {
        let idArray = elements.map {
            (element) -> Int in
            return element.id
        }
        let maxId = idArray.reduce(0, combine: { (currentMax: Int, nextId: Int) -> Int in
            return max(currentMax, nextId)})
        let newModel = PickerModel(id: maxId + 1, label: elementName)
        _elements.append(newModel)
    }

    public func removeElement(element: PickerModel) {
        let elementIndex = find(_elements, element)
        if let index = elementIndex {
            _elements.removeAtIndex(index);
        }
    }
}

