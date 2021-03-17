# Navigate

``` swift
@available(iOS 9.0, *) public class Navigate
```

## Initializers

### `init(controller:)`

``` swift
public init(controller: UINavigationController? = nil)
```

## Properties

### `shared`

``` swift
var shared: Navigate
```

## Methods

### `configure(controller:)`

Configure the Navigate Singleton with the Root Navigation Controller

``` swift
@discardableResult public func configure(controller: UINavigationController?) -> Self
```

### `set(title:)`

Set the visibleViewController's title

``` swift
@discardableResult public func set(title: String) -> Self
```

#### Parameters

  - title: The title of the currentViewController

### `setLeft(barButton:animated:)`

Set the left barButton

``` swift
@discardableResult public func setLeft(barButton: UIBarButtonItem?, animated: Bool = true) -> Self
```

#### Parameters

  - barButton: The UIBarButtonItem to be set
  - animated: Should animate setting the left UIBarButtonItem

### `setRight(barButton:animated:)`

Set the right barButton

``` swift
@discardableResult public func setRight(barButton: UIBarButtonItem?, animated: Bool = true) -> Self
```

#### Parameters

  - barButton: The UIBarButtonItem to be set
  - animated: Should animate setting the right UIBarButtonItem

### `setLeft(barButtons:animated:)`

Set the left barButtons

``` swift
@discardableResult public func setLeft(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self
```

#### Parameters

  - barButton: The \[UIBarButtonItem\] to be set
  - animated: Should animate setting the left \[UIBarButtonItem\]

### `setRight(barButtons:animated:)`

Set the right barButtons

``` swift
@discardableResult public func setRight(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self
```

#### Parameters

  - barButton: The \[UIBarButtonItem\] to be set
  - animated: Should animate setting the right \[UIBarButtonItem\]

### `go(_:style:completion:)`

Go to a viewController by using the configured NavigationController

``` swift
public func go(_ viewController: UIViewController, style: NavigationStyle, completion: (() -> Void)? = nil)
```

#### Parameters

  - viewController: UIViewController to navigate to
  - style: Style of navigation

### `go(from:to:style:completion:)`

Go to a viewController by using another viewController

``` swift
public func go(from: UIViewController, to: UIViewController, style: NavigationStyle, completion: (() -> Void)? = nil)
```

#### Parameters

  - from: The UIViewController that is handling the navigation
  - viewController: UIViewController to navigate to
  - style: Style of navigation

### `back(toRoot:)`

Navigate back and dismiss the visibleViewController

``` swift
public func back(toRoot: Bool = false)
```

#### Parameters

  - toRoot: Should navigate back to the rootViewController

### `dismiss()`

Dismiss the visibleViewController

``` swift
public func dismiss()
```

### `alert(title:message:withActions:secondsToPersist:_:)`

Show an Alert

``` swift
public func alert(title: String, message: String, withActions actions: [UIAlertAction] = [], secondsToPersist: Double?, _ closure: ((UIAlertController) -> Void)? = nil)
```

#### Parameters

  - title: Title of the UIAlertController
  - message: Message of the UIAlertController
  - withactions: Array of action objects to be added to the Alert
  - secondsToPersist: Amount of seconds the Alert should show before dismissing itself
  - closure: A closure that is passed the UIAlertController before presenting it

### `actionSheet(title:message:withActions:_:)`

Show an ActionSheet

``` swift
public func actionSheet(title: String, message: String, withActions actions: [UIAlertAction] = [], _ closure: ((UIAlertController) -> Void)? = nil)
```

#### Parameters

  - title: Title of the UIAlertController
  - message: Message of the UIAlertController
  - withactions: Array of action objects to be added to the ActionSheet
  - closure: A closure that is passed the UIAlertController before presenting it

### `toast(style:pinToTop:secondsToPersist:animationInDuration:animationOutDuration:padding:tapHandler:_:)`

Show a Toast Message

``` swift
@available(iOS 11.0, *) public func toast(style: ToastStyle = .custom, pinToTop: Bool = true, secondsToPersist: Double? = nil, animationInDuration: Double = 0.5, animationOutDuration: Double = 0.5, padding: Float = 8, tapHandler: @escaping (UIView) -> Void = { $0.removeFromSuperview() }, _ closure: @escaping () -> UIView)
```

#### Parameters

  - style: The ToastStyle (default: .custom)
  - pinToTop: Should the Toast pin to the top or bottom (default: true)
  - secondsToPersist: Amount of seconds the Toast should show before dismissing itself
  - animationInDuration: The amount of seconds the Toast should fade in (default: 0.5)
  - animationOutDuration: The amount of seconds the Toast should fade out (default: 0.5)
  - padding: The amount of spacing around the Toast
  - tapHandler: What happens when the user taps on the Toast (default: { $0.removeFromSuperview() })
  - closure: A trailing closure that accepts a view

### `destroyToast()`

Destory the toast

``` swift
public func destroyToast()
```
