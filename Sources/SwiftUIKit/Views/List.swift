//
//  Table.swift
//  
//
//  Created by Zach Eriksen on 11/2/19.
//

import UIKit

public class List: UITableView {
    private var data: [UIView]
    private var defaultCellHeight: Float?
    private var estimatedCellHeight: Float?
    
    private var didSelectHandler: ((UIView) -> Void)?
    private var configureCell: ((UITableViewCell) -> Void)?
    
    public init(
        defaultCellHeight: Float? = nil,
        estimatedCellHeight: Float? = nil,
        content: () -> [UIView]
    ) {
        
        self.defaultCellHeight = defaultCellHeight
        self.estimatedCellHeight = estimatedCellHeight
        self.data = content()
        
        super.init(frame: .zero, style: .plain)
        
        delegate = self
        dataSource = self
        
        register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension List {
    @discardableResult
    func didSelectHandler(_ action: @escaping (UIView) -> Void) -> Self {
        self.didSelectHandler = action
        
        return self
    }
    
    @discardableResult
    func configureCell(_ action: @escaping (UITableViewCell) -> Void) -> Self {
        self.configureCell = action
        
        return self
    }
}

extension List: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        configureCell?(cell)
        cell.contentView.clear()
            .embed { self.data[indexPath.row] }
        
        // Start LoadingViews
        if let view = cell.contentView.allSubviews.first(where: { $0 is LoadingView }),
           let loadingView = view as? LoadingView {
            loadingView.start()
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let height = defaultCellHeight else {
            return UITableView.automaticDimension
        }
        return CGFloat(height)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let height = estimatedCellHeight else {
            return 44
        }
        return CGFloat(height)
    }
}

extension List: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectHandler?(data[indexPath.row])
    }
}
