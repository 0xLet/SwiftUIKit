# ContainerView

A UIView that contains a child UIViewController

``` swift
@available(iOS 9.0, *) public class ContainerView: UIView
```

## Inheritance

`UIView`

## Initializers

### `init(parent:child:)`

Creates a UIView

``` swift
public init(parent: UIViewController, child: () -> UIViewController)
```

#### Parameters

  - parent: The parent UIViewController of the view
  - child: The UIViewController to embed

## Properties

### `viewController`

The embedded child UIViewController

``` swift
var viewController: UIViewController
```
