//
//  PickerModelStore.swift
//  Picker
//
//  Created by Daisuke Fujiwara on 4/26/15.
//  Copyright (c) 2015 daisuke.com. All rights reserved.
//

import Foundation

public struct PickerModelStore {
    public let elements: [PickerModel]

    public init() {
        var people: [PickerModel] = []
        for (index, element) in enumerate(["Sophie", "Grant", "Abhijeet", "Wes", "Jin", "Mitali"]) {
            let model = PickerModel(id: index, label: element)
            people.append(model)
        }
        self.elements = people
    }

    public func randomSelect() -> (Int?, PickerModel?) {
        if elements.isEmpty {
           return (nil, nil)
        }
        let randomIndex = Int(arc4random_uniform(UInt32(elements.count)))
        return (randomIndex, elements[randomIndex])
    }
}

