# SwiftUIKit

UIKit version of SwiftUI

## Example Code
```Swift
import UIKit
import SwiftUIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.embed {
            View(backgroundColor: .clear)
                .vstack {
                    return [
                        VStack {
                            return [
                                Label("Hello World"),
                                Label("Testing VStack"),
                                Button("Hello Tap Me!", titleColor: .systemBlue) {
                                    print("Hello You Tapped me!")
                                }.layer {
                                    $0.borderWidth = 3
                                    $0.borderColor = UIColor.systemBlue.cgColor
                                    $0.cornerRadius = 6
                                }
                            ]
                        }
                        .frame(height: 200),
                        Spacer(height: 4),
                        HStack { [Label("Body"), Spacer(), Label("Details")] },
                        Spacer()
                    ]
            }
            .padding()
        }
        
    }
}
```

## Example View

![Example SwiftUIKit](assets/exampleView_01.png)