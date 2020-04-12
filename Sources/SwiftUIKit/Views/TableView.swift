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

public protocol CellUpdatable: UITableViewCell {
    func update(forData data: CellDisplayable)
}

public protocol CellConfigurable: UITableViewCell {
    func configure(forData data: CellDisplayable)
}

public typealias StaticTableViewCell = DataConfigurable & CellConfigurable
public typealias DynamicTableViewCell = StaticTableViewCell & CellUpdatable

public typealias TableHeaderFooterViewHandler = (Int) -> UIView?
public typealias TableHeaderFooterTitleHandler = (Int) -> String?

public class TableView: UITableView {
    public var data: [[CellDisplayable]]
    
    fileprivate var headerViewForSection: TableHeaderFooterViewHandler?
    fileprivate var footerViewForSection: TableHeaderFooterViewHandler?
    fileprivate var headerTitleForSection: TableHeaderFooterTitleHandler?
    fileprivate var footerTitleForSection: TableHeaderFooterTitleHandler?
    
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
    func update(shouldReloadData: Bool = false,
                closure: ([[CellDisplayable]]) -> [[CellDisplayable]]) -> Self {
        data = closure(data)
        
        if shouldReloadData {
            reloadData()
        }
        
        return self
    }
    
    @discardableResult
    func append(shouldReloadData: Bool = false,
                closure: () -> [[CellDisplayable]]) -> Self {
        data += closure()
        
        if shouldReloadData {
            reloadData()
        }
        
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
        
        if let configure = cell as? CellUpdatable {
            configure.update(forData: cellData)
        }
        
        guard cell.contentView.allSubviews.count == 0 else {
            return cell
        }
        
        if let configure = cell as? CellConfigurable {
            configure.configure(forData: cellData)
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerViewForSection?(section)
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        headerTitleForSection?(section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footerViewForSection?(section)
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        footerTitleForSection?(section)
    }
}

public extension TableView {
    @discardableResult
    func set(dataSource: UITableViewDataSource) -> Self {
        self.dataSource = dataSource
        
        return self
    }
    
    @discardableResult
    func set(delegate: UITableViewDelegate) -> Self {
        self.delegate = delegate
        
        return self
    }
    
    @discardableResult
    func register(cells: [String: UITableViewCell.Type]) -> Self {
        cells.forEach { (arg) in
            let (key, value) = arg
            register(value, forCellReuseIdentifier: key)
        }
        
        return self
    }
    
    @discardableResult
    func headerView(handler: @escaping TableHeaderFooterViewHandler) -> Self  {
        headerViewForSection = handler
        
        return self
    }
    
    @discardableResult
    func footerView(handler: @escaping TableHeaderFooterViewHandler) -> Self  {
        footerViewForSection = handler
        
        return self
    }
    
    @discardableResult
    func headerTitle(handler: @escaping TableHeaderFooterTitleHandler) -> Self  {
        headerTitleForSection = handler
        
        return self
    }
    
    @discardableResult
    func footerTitle(handler: @escaping TableHeaderFooterTitleHandler) -> Self  {
        footerTitleForSection = handler
        
        return self
    }
}


