# Basic List

```swift
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

<img src="https://github.com/0xLeif/SwiftUIKit/blob/3.0.0/assets/exampleView_01.png?raw=true" width="256">