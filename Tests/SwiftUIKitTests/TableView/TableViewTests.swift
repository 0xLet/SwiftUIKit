//
//  TableViewTests.swift
//  SwiftUIKitTests
//
//  Created by Zach Eriksen on 4/12/20.
//

import XCTest
import UIKit
@testable import SwiftUIKit

@available(iOS 11.0, *)
class TableViewTests: XCTestCase {
    
    func testTableViewNoCells() {
        let table = TableView()
        
        table.register(cells: [])
        
        table
            .append {
                [
                    [
                        TableTestHelper.InfoData(title: "First Info!", count: 01, bio: "This is the very first!"),
                        TableTestHelper.InfoData(title: "Second!", count: 3, bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dignissim bibendum mi, non posuere risus imperdiet vitae. Vestibulum sed magna nec nunc finibus tempus quis nec sapien. Etiam non faucibus turpis. Ut diam libero, porttitor mollis leo sed, venenatis varius eros. Etiam ut sollicitudin massa. Integer consequat laoreet dui at tincidunt. Donec eget lacinia ligula. Aliquam eu maximus magna."),
                        TableTestHelper.InfoData(title: "2nd Section!", count: 2222, bio: "2")
                    ]
                    
                ]
        }
        
        XCTAssertEqual(table.sections(), 1)
        XCTAssertEqual(table.rows(forSection: 0), 3)
    }

    func testTableViewAppend() {
        let table = TableView()
        
        table.register(cells: [
            TableTestHelper.InfoCell.self,
        ])
        
        table
            .append {
                [
                    [
                        TableTestHelper.InfoData(title: "First Info!", count: 01, bio: "This is the very first!"),
                        TableTestHelper.InfoData(title: "Second!", count: 3, bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dignissim bibendum mi, non posuere risus imperdiet vitae. Vestibulum sed magna nec nunc finibus tempus quis nec sapien. Etiam non faucibus turpis. Ut diam libero, porttitor mollis leo sed, venenatis varius eros. Etiam ut sollicitudin massa. Integer consequat laoreet dui at tincidunt. Donec eget lacinia ligula. Aliquam eu maximus magna."),
                        TableTestHelper.InfoData(title: "2nd Section!", count: 2222, bio: "2")
                    ]
                    
                ]
        }
        
        XCTAssertEqual(table.sections(), 1)
        XCTAssertEqual(table.rows(forSection: 0), 3)
    }
    
    func testTableViewUpdate() {
        let table = TableView()
        
        table.register(cells: [
            TableTestHelper.InfoCell.self,
        ])
        
        table.append {
            [
                [TableTestHelper.InfoData(title: "First Info!", count: 01, bio: "This is the very first!")]
            ]
        }
        
        table
            .update { data in 
                [
                    [
                        TableTestHelper.InfoData(title: "Second!", count: 3, bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dignissim bibendum mi, non posuere risus imperdiet vitae. Vestibulum sed magna nec nunc finibus tempus quis nec sapien. Etiam non faucibus turpis. Ut diam libero, porttitor mollis leo sed, venenatis varius eros. Etiam ut sollicitudin massa. Integer consequat laoreet dui at tincidunt. Donec eget lacinia ligula. Aliquam eu maximus magna."),
                        TableTestHelper.InfoData(title: "2nd Section!", count: 2222, bio: "2")
                    ]
                    
                ] +
                data
        }
        
        XCTAssertEqual(table.sections(), 2)
        XCTAssertEqual(table.rows(forSection: 0), 2)
        XCTAssertEqual(table.rows(forSection: 1), 1)
    }
    
    func testTableViewUpdate_OneSection() {
        let table = TableView()
        
        table.register(cells: [
            TableTestHelper.InfoCell.self,
        ])
        
        table.append {
            [
                [TableTestHelper.InfoData(title: "First Info!", count: 01, bio: "This is the very first!")]
            ]
        }
        
        table
            .update { data in
                var data = data
                
                data[0] += [
                    TableTestHelper.InfoData(title: "Second!", count: 3, bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dignissim bibendum mi, non posuere risus imperdiet vitae. Vestibulum sed magna nec nunc finibus tempus quis nec sapien. Etiam non faucibus turpis. Ut diam libero, porttitor mollis leo sed, venenatis varius eros. Etiam ut sollicitudin massa. Integer consequat laoreet dui at tincidunt. Donec eget lacinia ligula. Aliquam eu maximus magna."),
                    TableTestHelper.InfoData(title: "2nd Section!", count: 2222, bio: "2")
                ]
                
                return data
        }
        
        XCTAssertEqual(table.sections(), 1)
        XCTAssertEqual(table.rows(forSection: 0), 3)
    }
}

@available(iOS 11.0, *)
fileprivate class TableTestHelper {
    struct InfoData {
        let title: String
        let count: Int
        let bio: String
    }

    class InfoCell: UITableViewCell {
        let label: Label = Label("")
        let detailLabel: Label = Label("")
        let bioLabel: Label = Label("")
    }
}

@available(iOS 11.0, *)
extension TableTestHelper.InfoData: CellDisplayable {
    var cellID: String {
        TableTestHelper.InfoCell.ID
    }
}

@available(iOS 11.0, *)
extension TableTestHelper.InfoCell: TableViewCell {
    static var ID: String {
        "InfoCell"
    }
    
    func update(forData data: CellDisplayable) {
        guard let data = data as? TableTestHelper.InfoData else {
            return
        }
        
        label.text = "SomeCell! \(data.title)"
        detailLabel.text = "\(data.count)"
        bioLabel.text = data.bio
    }
    
    func configure(forData data: CellDisplayable) {
        guard contentView.allSubviews.count == 0 else {
            return
        }
        
        contentView
            .clear()
            .embed {
                VStack {
                    [
                        HStack {
                            [
                                label,
                                Spacer(),
                                detailLabel
                            ]
                        }
                        .padding(16),
                        bioLabel
                            .number(ofLines: 5)
                    ]
                }
        }
    }
}
