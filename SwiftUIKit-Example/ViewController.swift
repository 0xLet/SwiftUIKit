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
            let someView = View(backgroundColor: .brown)
            return someView.vstack {
                let title = Label("Hello World")
                let body = Label("This is some body text")
                let someNumber = Label("456")
                let hstack = HStack {
                    [body, Spacer(), someNumber]
                }
                
                return [title, hstack]
            }
        }
    }
}
