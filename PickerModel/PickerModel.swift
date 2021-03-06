//
//  PickerModel.swift
//  Picker
//
//  Created by Daisuke Fujiwara on 4/26/15.
//  Copyright (c) 2015 daisuke.com. All rights reserved.
//

import Foundation

public struct PickerModel: Comparable {
    public let id: Int
    public let label: String
}

public func <(lhs: PickerModel, rhs: PickerModel) -> Bool {
    return lhs.id < rhs.id
}

public func ==(lhs: PickerModel, rhs: PickerModel) -> Bool {
    return lhs.id == rhs.id
}