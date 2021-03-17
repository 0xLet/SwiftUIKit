# NavButton

``` swift
@available(iOS 9.0, *) public class NavButton: Button
```

## Inheritance

[`Button`](/Button)

## Initializers

### `init(title:tapHandler:destination:style:titleColor:backgroundColor:)`

``` swift
public init(title: String, tapHandler: (() -> Void)? = nil, destination: @escaping () -> UIViewController, style: Navigate.NavigationStyle, titleColor: UIColor? = nil, backgroundColor: UIColor? = nil)
```

### `init(tapHandler:destination:style:labelView:)`

``` swift
public init(tapHandler: (() -> Void)? = nil, destination: @escaping () -> UIViewController, style: Navigate.NavigationStyle, labelView: () -> UIView)
```
