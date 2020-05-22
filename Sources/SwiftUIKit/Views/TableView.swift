//
//  TableView.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 4/12/20.
//

import UIKit

@available(iOS 9.0, *)
public protocol CellDisplayable {
    var cellID: String { get }
}

@available(iOS 9.0, *)
public protocol DataConfigurable: UITableViewCell {
    static var ID: String { get }
}

@available(iOS 9.0, *)
public protocol CellUpdatable: UITableViewCell {
    func update(forData data: CellDisplayable)
}

@available(iOS 9.0, *)
public protocol CellConfigurable: UITableViewCell {
    func configure(forData data: CellDisplayable)
}

@available(iOS 9.0, *)
public typealias TableViewCell = DataConfigurable & CellConfigurable & CellUpdatable

public typealias TableHeaderFooterViewHandler = (Int) -> UIView?
public typealias TableHeaderFooterTitleHandler = (Int) -> String?
public typealias TableDidSelectIndexPathHandler = (IndexPath) -> Void
public typealias TableHighlightIndexPathHandler = (IndexPath) -> Bool

@available(iOS 9.0, *)
public class TableView: UITableView {
    public var data: [[CellDisplayable]]
    
    fileprivate var headerViewForSection: TableHeaderFooterViewHandler?
    fileprivate var footerViewForSection: TableHeaderFooterViewHandler?
    fileprivate var headerTitleForSection: TableHeaderFooterTitleHandler?
    fileprivate var footerTitleForSection: TableHeaderFooterTitleHandler?
    fileprivate var didSelectRowAtIndexPath: TableDidSelectIndexPathHandler?
    fileprivate var shouldHighlightRowAtIndexPath: TableHighlightIndexPathHandler?
    
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

@available(iOS 9.0, *)
public extension TableView {
    @discardableResult
    func update(shouldReloadData: Bool = false,
                _ closure: ([[CellDisplayable]]) -> [[CellDisplayable]]) -> Self {
        data = closure(data)
        
        if shouldReloadData {
            reloadData()
        }
        
        return self
    }
    
    @discardableResult
    func append(shouldReloadData: Bool = false,
                _ closure: () -> [[CellDisplayable]]) -> Self {
        data += closure()
        
        if shouldReloadData {
            reloadData()
        }
        
        return self
    }
}

@available(iOS 9.0, *)
extension TableView: UITableViewDelegate {
    
}

@available(iOS 9.0, *)
extension TableView: UITableViewDataSource {
    func sections() -> Int {
        data.count
    }
    
    func rows(forSection section: Int) -> Int {
        data[section].count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        sections()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows(forSection: section)
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
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAtIndexPath?(indexPath)
    }
       
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        shouldHighlightRowAtIndexPath?(indexPath) ?? true
    }
}

@available(iOS 9.0, *)
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
    func register(cells: [TableViewCell.Type]) -> Self {
        cells.forEach {
            register($0, forCellReuseIdentifier: $0.ID)
        }
        
        return self
    }
    
    @discardableResult
    func headerView(_ handler: @escaping TableHeaderFooterViewHandler) -> Self  {
        headerViewForSection = handler
        
        return self
    }
    
    @discardableResult
    func footerView(_ handler: @escaping TableHeaderFooterViewHandler) -> Self  {
        footerViewForSection = handler
        
        return self
    }
    
    @discardableResult
    func headerTitle(_ handler: @escaping TableHeaderFooterTitleHandler) -> Self  {
        headerTitleForSection = handler
        
        return self
    }
    
    @discardableResult
    func footerTitle(_ handler: @escaping TableHeaderFooterTitleHandler) -> Self  {
        footerTitleForSection = handler
        
        return self
    }
    
    @discardableResult
    func didSelectRow(_ handler: @escaping TableDidSelectIndexPathHandler) -> Self  {
        didSelectRowAtIndexPath = handler
        
        return self
    }
    
    @discardableResult
    func shouldHighlightRow(_ handler: @escaping TableHighlightIndexPathHandler) -> Self  {
        shouldHighlightRowAtIndexPath = handler
        
        return self
    }
}


