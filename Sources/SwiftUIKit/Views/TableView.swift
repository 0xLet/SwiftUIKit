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

@available(iOS 9.0, *)
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
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        nil
    }
    
    public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        0
    }
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        nil
    }
    
    // MARK: Actions
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        
    }
    
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        .none
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        .none
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
}


