# VScroll

A view that only allows for vertical scrolling.

``` swift
@available(iOS 9.0, *) public class VScroll: UIView
```

## Inheritance

`UIView`

## Initializers

### `init(withPadding:_:)`

Creates a new view with a `ScrollView` embedded inside of a parent view.

``` swift
public init(withPadding padding: Float = 0, _ closure: () -> UIView)
```

#### Parameters

  - padding: Leading and Trailing padding of the scrollable view (Default: 0)
  - closure: A closure that returns the scrollable view
