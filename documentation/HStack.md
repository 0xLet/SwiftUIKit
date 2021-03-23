# HStack

A view that horizontally stacks views.

``` swift
@available(iOS 9.0, *) public class HStack: UIView
```

## Inheritance

`UIView`

## Initializers

### `init(withSpacing:padding:alignment:distribution:_:)`

Create a HStack

``` swift
public init(withSpacing spacing: Float = 0, padding: Float = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, _ closure: () -> [UIView])
```

#### Parameters

  - withSpacing: The amount of spacing between each child view (Default: 0)
  - padding: The amount of space between this view and its parent view (Default: 0)
  - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment) (Default: .fill)
  - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution) (Default: .fill)
  - closure: A trailing closure that accepts an array of views

### `init(withSpacing:padding:alignment:distribution:_:)`

Create a HStack that accepts an array of UIView?

``` swift
public init(withSpacing spacing: Float = 0, padding: Float = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, _ closure: () -> [UIView?])
```

#### Parameters

  - withSpacing: The amount of spacing between each child view
  - padding: The amount of space between this view and its parent view
  - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment)
  - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution)
  - closure: A trailing closure that accepts an array of optional views

## Properties

### `views`

The views that the HStack contains

``` swift
var views
```

## Methods

### `update(views:)`

Update the HStack with new views

``` swift
@discardableResult public func update(views closure: (inout [UIView]) -> Void) -> Self
```
