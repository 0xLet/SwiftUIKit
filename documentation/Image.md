# Image

A UIImageView that can show colors

``` swift
@available(iOS 9.0, *) public class Image: UIImageView
```

## Inheritance

`UIImageView`

## Initializers

### `init(_:)`

Creates a UIImageView with a UIImage from a UIImage

``` swift
public init(_ image: UIImage)
```

### `init(color:)`

Creates a UIImageView with a UIImage from a UIColor

``` swift
public init(color: UIColor)
```

### `init(named:)`

Creates a UIImageView with a UIImage from a named asset

``` swift
public init(named name: String)
```

## Methods

### `contentMode(_:)`

Sets the contentMode of the UIImageView

``` swift
@discardableResult public func contentMode(_ mode: UIView.ContentMode) -> Self
```
