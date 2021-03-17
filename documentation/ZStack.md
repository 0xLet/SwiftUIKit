# ZStack

ZStack:​
A view which stacks its children views in order

``` swift
@available(iOS 9.0, *) public class ZStack: UIView
```

## Inheritance

`UIView`

## Initializers

### `init(_:)`

Create a ZStack

``` swift
public init(_ closure: () -> [UIView])
```

#### Parameters

  - closure: A trailing closure that accepts an array of views

### `init(_:)`

Create a ZStack

``` swift
public init(_ closure: () -> [UIView?])
```

#### Parameters

  - closure: A trailing closure that accepts an array of optional views

## Properties

### `views`

The views that the ZStack contains

``` swift
var views: [UIView] = []
```
