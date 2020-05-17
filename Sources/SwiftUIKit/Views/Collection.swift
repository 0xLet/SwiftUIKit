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

public class Collection: UICollectionView {
  fileprivate var cellForItemAtHandler: ((UICollectionView, IndexPath) -> (UICollectionViewCell))? = nil
  
  fileprivate var layout: UICollectionViewLayout = UICollectionViewFlowLayout()
  
  fileprivate var sections = [Section]()
  
  public init() {
    super.init(frame: .zero, collectionViewLayout: layout)
    delegate = self
    dataSource = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Basic configuration
public extension Collection {
  @discardableResult
  func set(layoutTo layout: UICollectionViewLayout) -> Self {
    self.layout = layout
    
    return self
  }
  
  @discardableResult
  func set(delegateTo delegate: UICollectionViewDelegate) -> Self {
    self.delegate = delegate
    
    return self
  }
  
  @discardableResult
  func set(dataSourceTo dataSource: UICollectionViewDataSource) -> Self {
    self.dataSource = dataSource
    
    return self
  }
}

// MARK: - Data Source management
public extension Collection {
  @discardableResult
  func set(sectionsTo sections: [Section]) -> Self {
    self.sections = sections
    
    return self
  }
}

// MARK: - Auxiliary Data Source
extension Collection: UICollectionViewDataSource {
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
extension Collection: UICollectionViewDelegate {
}
