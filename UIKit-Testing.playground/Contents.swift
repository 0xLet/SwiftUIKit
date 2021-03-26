//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

import SwiftUIKit

class MyViewController : UIViewController {
    override func loadView() {
        view = UIView(backgroundColor: .white)
        
        view.embed {
            SafeAreaView {
                UIView(backgroundColor: .brown).center {
                    Button(title: "Click me!") {
                        print("!!!")
                    }
                }
            }
            .func { safeAreaView -> SafeAreaView in
                dump(safeAreaView)

                return safeAreaView
            }
            .ignore(
                topAnchorWithPadding: 0,
                leadingAnchorWithPadding: 0,
                trailingAnchorWithPadding: 0,
                bottomAnchorWithPadding: 0
            )
            .background(color: .cyan)
            .func { safeAreaView -> SafeAreaView in
                dump(safeAreaView)

                return safeAreaView
            }
        }
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
