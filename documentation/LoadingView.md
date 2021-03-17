# LoadingView

``` swift
@available(iOS 9.0, *) public class LoadingView: UIActivityIndicatorView
```

## Inheritance

`UIActivityIndicatorView`

## Initializers

### `init(forStyle:)`

``` swift
public init(forStyle style: UIActivityIndicatorView.Style? = nil)
```

## Methods

### `start()`

``` swift
@discardableResult func start() -> Self
```

### `stop()`

``` swift
@discardableResult func stop() -> Self
```

### `play(_:)`

``` swift
@discardableResult func play(_ ifTrue: () -> Bool) -> Self
```

### `color(_:)`

``` swift
@discardableResult func color(_ color: UIColor) -> Self
```
