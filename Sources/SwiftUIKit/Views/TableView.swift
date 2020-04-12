//
//  TableView.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 4/12/20.
//

import UIKit

public protocol CellDisplayable {
    var cellID: String { get }
}

public protocol DataConfigurable: UITableViewCell {
    static var ID: String { get }
}

public protocol CellConfigurable {
    func configure(forData data: CellDisplayable) -> UITableViewCell
}
