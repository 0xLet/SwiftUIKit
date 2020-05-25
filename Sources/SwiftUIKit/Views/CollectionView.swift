//
//  Collection.swift
//  SwiftUIKit
//
//  Created by Oskar on 16/05/2020.
//

import UIKit

@available(iOS 11, *)
public typealias CollectionViewCell = UICollectionViewCell & DataIdentifiable & CellDisplayable & CellUpdatable

@available(iOS 11, *)
public class CollectionView: UICollectionView {
    public var data: [[CellDisplayable]]
    
    fileprivate var cellForItemAtHandler: ((UICollectionView, IndexPath) -> (UICollectionViewCell))? = nil
    
    fileprivate var numberOfItemsInSectionHandler: ((UICollectionView, Int) -> Int)? = nil
    
    fileprivate var titles: [String]? = nil
    
    fileprivate var shouldSelectItemAtHandler: ((IndexPath) -> Bool)? = nil
    
    fileprivate var didSelectItemAtHandler: ((IndexPath) -> ())? = nil
    
    fileprivate var shouldDeselectItemAtHandler: ((IndexPath) -> Bool)? = nil
    
    fileprivate var didDeselectItemAtHandler: ((IndexPath) -> ())? = nil
    
    fileprivate var shouldBeginMultipleSelectionInteractionAtHandler: ((IndexPath) -> Bool)? = nil
    
    fileprivate var didBeginMultipleSelectionInteractionAtHandler: ((IndexPath) -> ())? = nil
    
    fileprivate var didEndMultipleSelectionInteractionHandler: ((UICollectionView) -> ())? = nil
    
    fileprivate var shouldHighlightItemAtHandler: ((IndexPath) -> Bool)? = nil
    
    fileprivate var didHighlightItemAtHandler: ((IndexPath) -> ())? = nil
    
    fileprivate var didUnhighlightItemAtHandler: ((IndexPath) -> ())? = nil
    
    fileprivate var willDisplayCellHandler: ((CollectionViewCell, IndexPath) -> ())? = nil
    
    fileprivate var didEndDisplayingCell: ((CollectionViewCell, IndexPath) -> ())? = nil
    
    fileprivate var transitionLayoutForHandler: ((_ old: UICollectionViewLayout, _ new: UICollectionViewLayout) -> UICollectionViewTransitionLayout)? = nil
    
    fileprivate var targetContentOffsetForHandler: ((_ proposed: CGPoint) -> CGPoint)? = nil
    
    fileprivate var targetIndexPathForMoveHandler: ((_ from: IndexPath, _ to: IndexPath) -> IndexPath)? = nil
    
    fileprivate var canFocusItemAtHandler: ((IndexPath) -> Bool)? = nil
    
    public init(initialData: [[CellDisplayable]] = [[CellDisplayable]]()) {
        data = initialData
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Auxiliary modifiers
@available(iOS 11, *)
public extension CollectionView {
    /// Set a new delegate for CollectionView.
    /// All modifiers depending on delegate will do nothing after calling that.
    @discardableResult
    func set(delegateTo delegate: UICollectionViewDelegate) -> Self {
        self.delegate = delegate
        
        return self
    }
    
    /// Set a new delegate for CollectionView.
    /// All modifiers depending on data source will do nothing after calling that.
    @discardableResult
    func set(dataSourceTo dataSource: UICollectionViewDataSource) -> Self {
        self.dataSource = dataSource
        
        return self
    }
}

// MARK: - Update data and layout
@available(iOS 11.0, *)
public extension CollectionView {
    /// Set a new layout for collection view.
    @discardableResult
    func set(layout: UICollectionViewLayout) -> Self {
        setCollectionViewLayout(layout, animated: false)
        
        return self
    }
    
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

// MARK: - Prefetching
@available(iOS 11, *)
public extension CollectionView {
    @discardableResult
    func prefetchingEnabled(_ bool: Bool) -> Self {
        isPrefetchingEnabled = bool
        
        return self
    }
    
    @discardableResult
    func prefetchDataSource(_ prefetchDataSource: () -> (UICollectionViewDataSourcePrefetching)) -> Self {
        self.prefetchDataSource = prefetchDataSource()
        
        return self
    }
}

// MARK: - Creating Collection Cells
@available(iOS 11, *)
public extension CollectionView {
    @discardableResult
    func register(cells: [CollectionViewCell.Type]) -> Self {
        cells.forEach {
            super.register($0, forCellWithReuseIdentifier: $0.ID)
        }
        
        return self
    }
}

// MARK: - Items management
@available(iOS 11, *)
public extension CollectionView {
    @discardableResult
    func insertItems(at indexPaths: [IndexPath]) -> Self {
        super.insertItems(at: indexPaths)
        
        return self
    }
    
    @discardableResult
    func insertItem(at indexPath: IndexPath) -> Self {
        super.insertItems(at: [indexPath])
        
        return self
    }
    
    @discardableResult
    func moveItem(at sourceIndexPath: IndexPath, to targetIndexPath: IndexPath) -> Self {
        super.moveItem(at: sourceIndexPath, to: targetIndexPath)
        
        return self
    }
    
    @discardableResult
    func moveItems(at sourceIndexPaths: [IndexPath], to targetIndexPaths: [IndexPath]) -> Self {
        for (source, target) in zip(sourceIndexPaths, targetIndexPaths) {
            super.moveItem(at: source, to: target)
        }
        
        return self
    }
    
    @discardableResult
    func deleteItem(at indexPath: IndexPath) -> Self {
        super.deleteItems(at: [indexPath])
        
        return self
    }
    
    @discardableResult
    func deleteItems(at indexPaths: [IndexPath]) -> Self {
        super.deleteItems(at: indexPaths)
        
        return self
    }
    
    @discardableResult
    func scrollToItem(at indexPath: IndexPath, at position: UICollectionView.ScrollPosition, animated: Bool = true) -> Self {
        super.scrollToItem(at: indexPath, at: position, animated: animated)
        
        return self
    }
    
    @discardableResult
    func allowSelection(_ bool: Bool, multiple: Bool = false) -> Self {
        allowsSelection = bool
        allowsMultipleSelection = multiple
        
        return self
    }
    
    @discardableResult
    func selectItem(at indexPath: IndexPath, animated: Bool, scrollPosition: UICollectionView.ScrollPosition) -> Self {
        super.selectItem(at: indexPath, animated: animated, scrollPosition: scrollPosition)
        
        return self
    }
    
    @discardableResult
    func deselectItem(at indexPath: IndexPath, animated: Bool) -> Self {
        super.deselectItem(at: indexPath, animated: animated)
        
        return self
    }
}

// MARK: - Section Management
@available(iOS 11, *)
public extension CollectionView {
    @discardableResult
    func insertSections(at indexSet: IndexSet) -> Self {
        super.insertSections(indexSet)
        
        return self
    }
    
    @discardableResult
    func moveSection(from section: Int, to newSection: Int) -> Self {
        super.moveSection(section, toSection: newSection)
        
        return self
    }
    
    @discardableResult
    func deleteSections(at sections: IndexSet) -> Self {
        super.deleteSections(sections)
        
        return self
    }
}


// MARK: - Appearance customization
@available(iOS 11, *)
public extension CollectionView {
    @discardableResult
    func set(backgroundView
        : UIView) -> Self {
        self.backgroundView = backgroundView
        
        return self
    }
}

// MARK: - Data Source modifiers
@available(iOS 11, *)
public extension CollectionView {
    /// - Parameter handler: Contains actually declared collection view and given section, expects to return number of items for given section.
    @discardableResult
    func setNumberOfItemsInSection(handler: @escaping ((UICollectionView, Int) -> Int)) -> Self {
        numberOfItemsInSectionHandler = handler
        
        return self
    }
    
    @discardableResult
    func configureCell(handler: @escaping ((UICollectionView, IndexPath) -> UICollectionViewCell)) -> Self {
        cellForItemAtHandler = handler
        
        return self
    }
    
    /// Set index titles for CollectionView
    /// - Parameter array: Used to provide titles for Collection View, order used is the same as the order of parameter.
    @discardableResult
    func setSectionTitles(shouldReloadData: Bool = false, to array: [String]) -> Self {
        titles = array
        
        if shouldReloadData {
            reloadData()
        }
        
        return self
    }
}

// MARK: - Auxiliary Data Source
@available(iOS 11, *)
extension CollectionView: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = data[indexPath.section][indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellData.cellID, for: indexPath)
        
        if let configure = cell as? CellUpdatable {
            configure.update()
        }
        
        return cell
    }
    
    public func indexTitles(for collectionView: UICollectionView) -> [String]? {
        return titles
    }
    
    public func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        IndexPath(index: index)
    }
}

// MARK: - Delegation modifiers
@available(iOS 11, *)
public extension CollectionView {
    @discardableResult
    func shouldSelectItem(_ handler: @escaping ((IndexPath) -> Bool)) -> Self {
        shouldSelectItemAtHandler = handler
        
        return self
    }
    
    @discardableResult
    func didSelectItemAt(_ handler: @escaping ((IndexPath) -> ())) -> Self {
        didSelectItemAtHandler = handler
        
        return self
    }
    
    @discardableResult
    func shouldDeselectItemAt(_ handler: @escaping ((IndexPath) -> Bool)) -> Self {
        shouldDeselectItemAtHandler = handler
        
        return self
    }
    
    @discardableResult
    func didDeselectItemAt(_ handler: @escaping ((IndexPath) -> ())) -> Self {
        didDeselectItemAtHandler = handler
        
        return self
    }
    
    @discardableResult
    func shouldBeginMultipleSelectionInteractionAt(_ handler: @escaping ((IndexPath) -> Bool)) -> Self {
        shouldBeginMultipleSelectionInteractionAtHandler = handler
        
        return self
    }
    
    @discardableResult
    func didBeginMultipleSelectionInteractionAt(_ handler: @escaping ((IndexPath) -> ())) -> Self {
        didBeginMultipleSelectionInteractionAtHandler = handler
        
        return self
    }
    
    @discardableResult
    func didEndMultipleSelectionSelectionInteraction(_ handler: @escaping ((UICollectionView) -> ())) -> Self {
        didEndMultipleSelectionInteractionHandler = handler
        
        return self
    }
    
    @discardableResult
    func shouldHighlightItemAt(_ handler: @escaping ((IndexPath) -> Bool)) -> Self {
        shouldHighlightItemAtHandler = handler
        
        return self
    }
    
    @discardableResult
    func didHighlightItemAt(_ handler: @escaping ((IndexPath) -> ())) -> Self {
        didHighlightItemAtHandler = handler
        
        return self
    }
    
    @discardableResult
    func didUnhighlightItemAt(_ handler: @escaping ((IndexPath) -> ())) -> Self {
        didUnhighlightItemAtHandler = handler
        
        return self
    }
    
    @discardableResult
    func willDisplayCellHandlerFor(_ handler: @escaping ((CollectionViewCell, IndexPath) -> ())) -> Self {
        willDisplayCellHandler = handler
        
        return self
    }
    
    @discardableResult
    func didEndDisplayingCellFor(_ handler: @escaping ((CollectionViewCell, IndexPath) -> ())) -> Self {
        didEndDisplayingCell = handler
        
        return self
    }
    
    @discardableResult
    func transitionLayoutFor(_ handler: @escaping (_ old: UICollectionViewLayout, _ new: UICollectionViewLayout) -> UICollectionViewTransitionLayout) -> Self {
        transitionLayoutForHandler = handler
        
        return self
    }
    
    @discardableResult
    func targetContentOffsetFor(_ handler: @escaping (_ proposed: CGPoint) -> CGPoint) -> Self {
        targetContentOffsetForHandler = handler
        
        return self
    }
    
    @discardableResult
    func targetIndexPathForMove(_ handler: @escaping (_ from: IndexPath, _ to: IndexPath) -> IndexPath) -> Self {
        targetIndexPathForMoveHandler = handler
        
        return self
    }
    
    @discardableResult
    func canFocusItemAt(_ handler: @escaping (IndexPath) -> Bool) -> Self {
        canFocusItemAtHandler = handler
        
        return self
    }
}

// MARK: - Auxiliary Delegation
@available(iOS 11, *)
extension CollectionView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return shouldSelectItemAtHandler?(indexPath) ?? true
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItemAtHandler?(indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        shouldDeselectItemAtHandler?(indexPath) ?? true
    }
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        didDeselectItemAtHandler?(indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        shouldBeginMultipleSelectionInteractionAtHandler?(indexPath) ?? true
    }
    
    public func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        didBeginMultipleSelectionInteractionAtHandler?(indexPath)
    }
    
    public func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView) {
        didEndMultipleSelectionInteractionHandler?(collectionView)
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        shouldHighlightItemAtHandler?(indexPath) ?? true
    }
    
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        didHighlightItemAtHandler?(indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        didUnhighlightItemAtHandler?(indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        willDisplayCellHandler?(cell as! CollectionViewCell, indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        didEndDisplayingCell?(cell as! CollectionViewCell, indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        transitionLayoutForHandler?(fromLayout, toLayout) ??
            UICollectionViewTransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
    }
    
    public func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        targetContentOffsetForHandler?(proposedContentOffset) ?? proposedContentOffset
    }
    
    public func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        targetIndexPathForMoveHandler?(originalIndexPath, proposedIndexPath) ?? proposedIndexPath
    }
    
    public func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        canFocusItemAtHandler?(indexPath) ?? true
    }
}
