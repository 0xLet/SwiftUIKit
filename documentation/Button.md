# Button

A UIButton that handles its own action.

``` swift
@available(iOS 9.0, *) public class Button: UIButton
```

## Inheritance

`UIButton`

## Initializers

### `init(title:titleColor:backgroundColor:forEvent:action:)`

Creates a UIButton

``` swift
public init(title: String, titleColor: UIColor? = nil, backgroundColor: UIColor? = nil, forEvent event: UIControl.Event = .touchUpInside, action: (() -> Void)? = nil)
```

#### Parameters

  - title: Text used for the button's title
  - titleColor: Color used for the title's font (Default: nil)
  - backgroundColor: Color used for the button's background color (Default: nil)
  - forEvent: UIControl event for when to fire action (Default: .touchUpInside) (Default: .touchUpInside)
  - action: Closure for the the button's action (Default: nil)

### `init(forEvent:action:labelView:)`

Creates a UIButton with a label view

``` swift
public init(forEvent event: UIControl.Event = .touchUpInside, action: (() -> Void)? = nil, labelView: () -> UIView)
```

#### Parameters

  - forEvent: UIControl event for when to fire action (Default: .touchUpInside)
  - action: Closure for the the button's action
  - labelView: The view to embed

## Methods

### `setAction(_:)`

Update the button's action

``` swift
@discardableResult public func setAction(_ action: (() -> Void)?) -> Self
```
