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

public class TableView: UITableView {
    public var data: [[CellDisplayable]]
    
    public init(initalData: [[CellDisplayable]] = [[CellDisplayable]](),
                style: UITableView.Style = .plain) {
        self.data = initalData
        super.init(frame: .zero, style: style)
        
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension TableView {
    @discardableResult
    func update(closure: ([[CellDisplayable]]) -> [[CellDisplayable]]) -> Self {
        data = closure(data)
        
        return self
    }
    
    @discardableResult
    func append(closure: () -> [[CellDisplayable]]) -> Self {
        data += closure()
        
        return self
    }
    
    @discardableResult
    func reload() -> Self {
        reloadData()
        
        return self
    }
}

extension TableView: UITableViewDelegate {
    
}

extension TableView: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = data[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellData.cellID, for: indexPath)
        
        if let configure = cell as? CellConfigurable {
            return configure.configure(forData: cellData)
        }
        
        return cell
    }
}

public extension TableView {
    @discardableResult
    func dataSource(closure: () -> UITableViewDataSource) -> Self {
        dataSource = closure()
        
        return self
    }
    
    @discardableResult
    func delegate(closure: () -> UITableViewDelegate) -> Self {
        delegate = closure()
        
        return self
    }
    
    @discardableResult
    func registerCells(closure: () -> [String: UITableViewCell.Type]) -> Self {
        closure().forEach { (arg) in
            let (key, value) = arg
            register(value, forCellReuseIdentifier: key)
        }
        
        return self
    }
}


