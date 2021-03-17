# VStack

Vertical StackView

``` swift
@available(iOS 9.0, *) public class VStack: UIView
```

## Inheritance

`UIView`

## Initializers

### `init(withSpacing:padding:alignment:distribution:_:)`

Create a VStack

``` swift
public init(withSpacing spacing: Float = 0, padding: Float = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, _ closure: () -> [UIView])
```

#### Parameters

  - withSpacing: The amount of spacing between each child view
  - padding: The amount of space between this view and its parent view
  - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment)
  - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution)
  - closure: A trailing closure that accepts an array of views

### `init(withSpacing:padding:alignment:distribution:_:)`

Create a VStack that accepts an array of UIView?

``` swift
public init(withSpacing spacing: Float = 0, padding: Float = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, _ closure: () -> [UIView?])
```

#### Parameters

  - withSpacing: The amount of spacing between each child view
  - padding: The amount of space between this view and its parent view
  - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment)
  - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution)
  - closure: A trailing closure that accepts an array of optional views

## Methods

### `update(views:)`

``` swift
@discardableResult public func update(views closure: (inout [UIView]) -> Void) -> Self
```
