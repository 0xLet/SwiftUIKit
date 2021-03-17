# LoadingImage

``` swift
@available(iOS 9.0, *) public class LoadingImage: UIView
```

## Inheritance

`UIView`

## Initializers

### `init(url:loadingTint:onErrorLoading:onCompletedLoading:)`

``` swift
public init(url: URL? = nil, loadingTint: UIColor? = nil, onErrorLoading: ((LoadingImage?, Error?) -> Void)? = nil, onCompletedLoading: ((UIImage?) -> Void)? = nil)
```

## Methods

### `contentMode(_:)`

``` swift
@discardableResult public func contentMode(_ mode: UIView.ContentMode) -> Self
```

### `onImageLoaded(_:)`

``` swift
@discardableResult public func onImageLoaded(_ handler: @escaping (UIImage?) -> Void) -> Self
```

### `load(url:)`

``` swift
@discardableResult public func load(url: URL?) -> Self
```

### `update(image:)`

``` swift
public func update(image: UIImage)
```
