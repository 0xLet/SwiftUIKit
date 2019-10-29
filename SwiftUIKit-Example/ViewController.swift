//
//  ViewController.swift
//  SwiftUIKit-Example
//
//  Created by Zach Eriksen on 10/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.embed {
            let someView = UIView()
            someView.backgroundColor = .brown
            return someView.vstack {
                let title = UILabel()
                title.text = "Hello World"
                return [title]
            }
        }
    }
}
