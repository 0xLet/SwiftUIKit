# SwiftUIKit
<img src="assets/SwiftUIKit_logo_v1.png" width="256">

UIKit code that is fun to write.

## [Documentation](docs/index.html) (WIP)


## Example Code
```Swift
import UIKit
import SwiftUIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Navigate.shared.configure(controller: navigationController)
            .set(title: "Hello SwiftUIKit")
            .setRight(barButton: BarButton {
                Button("Button 0") {
                    print("Tapped the barbutton")
                }
            })
        
        
        view.embed {
            SafeAreaView {
                List(defaultCellHeight: 60) {
                    [
                        Button("Say Hello") {
                            print("Hello World!")
                        },
                        
                        HStack(withSpacing: 8) {
                            [
                                Label("Name"),
                                
                                Divider(.vertical),
                                
                                Spacer(),
                                
                                TextField(value: "SwiftUIKit",
                                      placeholder: "Some Name",
                                      keyboardType: .default)
                                    .inputHandler { print("New Name: \($0)") }
                            ]
                        },
                        
                        Label.callout("This is some callout text!"),
                        
                        ZStack {
                            [
                                Image(.blue)
                                    .frame(height: 60, width: 60)
                                    .offset(x: 100)
                            ]
                        },
                        
                        NavButton(destination: {
                            UIViewController {
                                UIView(backgroundColor: .white) {
                                    LoadingImage(URL(string: "https://cdn11.bigcommerce.com/s-oe2q4reh/images/stencil/2048x2048/products/832/1401/Beige_Pekingese_Puppy__21677.1568609759.jpg")!)
                                        .contentMode(.scaleAspectFit)
                                }
                            }
                        }, style: .push) {
                            Label("Go see a puppy")
                        },
                        
                        Button("Show an Alert") {
                            Navigate.shared.alert(title: "Hello this is an Alert!",
                                                  message: "Just a test...",
                                                  secondsToPersist: 3)
                        },
                        
                        Button("Show an Alert w/ cancel") {
                            Navigate.shared.alert(title: "Hello World",
                                                  message: "This is an alert",
                                                  withActions: [.cancel],
                                                  secondsToPersist: 3)
                        },
                        
                        Button("Show a Toast Message") {
                            Navigate.shared.toast(style: .error, pinToTop: true, secondsToPersist: 4) {
                                Label("This is a test error message!")
                            }
                        }
                    ]
                }
            }
        }
    }
}
```

## Example View

![Example SwiftUIKit](assets/exampleView_01.png)

## GitHub Supporters

[<img class="avatar" alt="suzyfendrick" src="https://avatars1.githubusercontent.com/u/25371717?s=460&u=34217047bbfd4912909cd5a85959544b6e49cc9f&v=4" width="72" height="72">](https://github.com/suzyfendrick)


****

## oneleif project
This means that the project is sponsored by the oneleif community, and the collaborators are team members from oneleif.

<a href="http://oneleif.com" rel="oneleif website">![](https://github.com/oneleif/olDocs/blob/master/assets/images/oneleif_logos/full_logo/oneleif_whiteback.png)</a>



[![](https://img.shields.io/badge/oneleif-Twitter-blue.svg)](https://twitter.com/oneleifdev)

[![](https://img.shields.io/badge/oneleif-YouTube-red.svg)](https://www.youtube.com/channel/UC3HN0jID38K0Vb_WChvgQmA)

## What is oneleif?
oneleif is a nonprofit community that supports tech minded individuals. We do this by offering a fun loving community that works on Open Sourced projects together. 
We love to give back through free resources and guidance.

## How to join oneleif
Click on the link below to join the Discord server.

[![](https://img.shields.io/badge/oneleif-Discord-7284be.svg)](https://discord.gg/tv9UdJK)

-OR-

[Check out our website](http://oneleif.com)


### Questions?
Feel free to email us at: oneleifdev@gmail.com 

-OR-

Ask questions in the discord
