//
//  DynamicTable.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 1/19/20.
//

import UIKit

public class DynamicTable<T>: UITableView, UITableViewDelegate, UITableViewDataSource {
    fileprivate var data: [T] {
        didSet {
            if loadAmount > data.count {
                reloadData()
            }
        }
    }
    fileprivate var cellHeights = [IndexPath: CGFloat]()
    
    // Mark: Batch Loading
    fileprivate var loadThreshold: CGFloat = 0.75 // 75%
    fileprivate var loadAmount: Int = 25
    fileprivate var loadCount: Int = 1
    fileprivate var batchCount: Int {
        return loadAmount * loadCount
    }
    
    fileprivate var currentItems = 0
    
    private var didSelectHandler: ((UITableViewCell) -> Void)?
    private var configureCell: ((UITableViewCell, IndexPath, T) -> Void)?
    
    public init(data: [T], style: UITableView.Style = .plain) {
        self.data = data
        
        super.init(frame: .zero, style: style)
        
        delegate = self
        dataSource = self
        register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    public init(dataType: T.Type, style: UITableView.Style = .plain) {
        data = []
        
        super.init(frame: .zero, style: style)
        
        delegate = self
        dataSource = self
        register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func reload() {
        if data.count >= batchCount {
            loadCount += 1
            print("Load Count: \(loadCount)")
        }
        
        reloadData()
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard batchCount < data.count else {
            print("Loading Elements: \(data.count)")
            
            currentItems = data.count
            return data.count + 1
        }
        
        print("Loading Batch: \(batchCount)")
        currentItems = batchCount
        return batchCount + 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == currentItems,
            indexPath.row < data.count {
            print("Next Batch")
            reload()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard indexPath.row != data.count else {
            cell.contentView.clear()
                .embed {
                    VStack {
                        [
                            LoadingView()
                                .start()
                        ]
                    }
            }
            
            return cell
        }
        
        let cellData = data[indexPath.row]
        
        configureCell?(cell, indexPath, cellData)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeights[indexPath] = cell.frame.size.height
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath] ?? UITableView.automaticDimension
    }
}

public extension DynamicTable {
    @discardableResult
    func didSelectHandler(_ action: @escaping (UITableViewCell) -> Void) -> Self {
        self.didSelectHandler = action
        
        return self
    }
    
    @discardableResult
    func configureCell(_ action: @escaping (UITableViewCell, IndexPath, T) -> Void) -> Self {
        self.configureCell = action
        
        return self
    }
    
    @discardableResult
    func add(_ data: () -> [T]) -> Self {
        self.data += data()
        
        return self
    }
}
