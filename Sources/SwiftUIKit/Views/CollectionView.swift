//
//  Collection.swift
//  SwiftUIKit
//
//  Created by Oskar on 16/05/2020.
//

import UIKit

public struct Section {
  public var title: String
  public var numberOfItems: Int
  
  public init(title: String, numberOfItems: Int) {
    self.title = title
    self.numberOfItems = numberOfItems
  }
}

public class CollectionView: UICollectionView {
  fileprivate var cellForItemAtHandler: ((UICollectionView, IndexPath) -> (UICollectionViewCell))? = nil
    
  fileprivate var sections = [Section]()
  
  public init() {
    super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    delegate = self
    dataSource = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Basic configuration
public extension CollectionView {
  
  /// Set a new layout for collection view.
  @discardableResult
  func set(layoutTo layout: UICollectionViewLayout) -> Self {
    setCollectionViewLayout(layout, animated: false)
    
    return self
  }
  
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

// MARK: - Data Source management
public extension CollectionView {
  @discardableResult
  func set(sectionsTo sections: [Section]) -> Self {
    self.sections = sections
    reloadData()
    
    return self
  }
}

@available(iOS 10, *)
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
public extension CollectionView {
  @discardableResult
  func register(cell: AnyClass, with identifier: String) -> Self {
    super.register(cell, forCellWithReuseIdentifier: identifier)
    
    return self
  }
  
  @discardableResult
  func register(cellsWithIdentifiers: [(AnyClass, String)]) -> Self {
    for (cell, identifier) in cellsWithIdentifiers {
      super.register(cell, forCellWithReuseIdentifier: identifier)
    }
    
    return self
  }
  
  @discardableResult
  func register(nib: UINib, with identifier: String) -> Self {
    super.register(nib, forCellWithReuseIdentifier: identifier)
    
    return self
  }
  
  @discardableResult
  func register(nibsWithIdentifiers: [(UINib, String)]) -> Self {
    for (nib, identifier) in nibsWithIdentifiers {
      super.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    return self
  }
}

// MARK: - Items management
public extension CollectionView {
  @discardableResult
  func insertItems(at indexPaths: [IndexPath]) -> Self {
    super.insertItems(at: indexPaths)
    
    return self
  }
  
  @discardableResult
  func insertIem(at indexPath: IndexPath) -> Self {
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
}

// MARK: - Section Management
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
public extension CollectionView {
  @discardableResult
  func set(backgroundViewTo backgroundView: UIView) -> Self {
    self.backgroundView = backgroundView
    
    return self
  }
}

// MARK: - Auxiliary Data Source
extension CollectionView: UICollectionViewDataSource {
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    sections.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    sections[section].numberOfItems
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cellForItemAtHandler = cellForItemAtHandler else { return UICollectionViewCell() }
    return cellForItemAtHandler(collectionView, indexPath)
  }
}

// MARK: - Auxiliary Delegation
extension CollectionView: UICollectionViewDelegate {
}
