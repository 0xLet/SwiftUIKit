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
            return someView.vstack(padding: 16) {
                let title = Label("Hello World")
                    .frame(height: 400)
                    .padding(16)
                
                let body = Label("This is some body text")
                let someNumber = Label("456")
                
                let hstack = HStack(padding: 32) {
                    [body, Spacer(), someNumber]
                }
                
                return [title, hstack]
            }
        }
    }
}
