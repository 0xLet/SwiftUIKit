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
                VStack {
                    [
                        VStack {
                            [
                                Label("Hello World"),
                                Label("Testing VStack"),
                                Button("Hello Tap Me!", titleColor: .systemBlue, backgroundColor: .systemYellow) {
                                    print("Hello You Tapped me!")
                                    }
                                    .layer(borderWidth: 3)
                                    .layer(borderColor: UIColor.systemBlue.cgColor)
                                    .layer(cornerRadius: 6)
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

****

# oneleif Project

![](https://github.com/oneleif/olWebsite/blob/master/Public/images/homeLogo.png?raw=true)

### Project Info

This project is a oneleif active project.

[![](https://img.shields.io/badge/oneleif-Twitter-blue.svg)](https://twitter.com/oneleifdev)

[![](https://img.shields.io/badge/oneleif-YouTube-red.svg)](https://www.youtube.com/channel/UC3HN0jID38K0Vb_WChvgQmA)

## How to join oneleif
Click on the link below to join the Discord server.

You will start with limited permissions, in a text channel that only moderators will see.

To get full access: read the rules, make an introduction in #introductions, and add an appropriate username.

When you're done with the above, shoot a message to the #start channel to let us know, and we will give you full access.

[![](https://img.shields.io/badge/oneleif-Discord-7284be.svg)](https://discord.gg/tv9UdJK)

### Questions?
Feel free to email us at: oneleifdev@gmail.com 
