# NavButton

A UISwitch that handles its own action and navigation

``` swift
@available(iOS 9.0, *) public class NavButton: Button
```

## Inheritance

[`Button`](/Button)

## Initializers

### `init(title:tapHandler:destination:style:titleColor:backgroundColor:)`

Creates a UIButton

``` swift
public init(title: String, tapHandler: (() -> Void)? = nil, destination: @escaping () -> UIViewController, style: Navigate.NavigationStyle, titleColor: UIColor? = nil, backgroundColor: UIColor? = nil)
```

#### Parameters

  - title: Text used for the button's title
  - tapHandler: Closure for the the button's action (Default: nil)
  - destination: Destination view to navigate to when tapped
  - style: Navigation style for presenting the destination view
  - titleColor: Color used for the title's font (Default: nil)
  - backgroundColor: Color used for the button's background color (Default: nil)

### `init(tapHandler:destination:style:labelView:)`

Creates a UIButton with a label view

``` swift
public init(tapHandler: (() -> Void)? = nil, destination: @escaping () -> UIViewController, style: Navigate.NavigationStyle, labelView: () -> UIView)
```

#### Parameters

  - tapHandler: Closure for the the button's action (Default: nil)
  - destination: Destination view to navigate to when tapped
  - style: Navigation style for presenting the destination view
  - labelView: The view to embed
