# Button

``` swift
@available(iOS 9.0, *) public class Button: UIButton
```

## Inheritance

`UIButton`

## Initializers

### `init(title:titleColor:backgroundColor:forEvent:action:)`

``` swift
public init(title: String, titleColor: UIColor? = nil, backgroundColor: UIColor? = nil, forEvent event: UIControl.Event = .touchUpInside, action: (() -> Void)? = nil)
```

### `init(forEvent:action:labelView:)`

``` swift
public init(forEvent event: UIControl.Event = .touchUpInside, action: (() -> Void)? = nil, labelView: () -> UIView)
```

## Methods

### `setAction(_:)`

``` swift
@discardableResult public func setAction(_ action: (() -> Void)?) -> Self
```
