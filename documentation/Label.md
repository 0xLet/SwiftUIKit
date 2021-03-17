# Label

``` swift
@available(iOS 9.0, *) public class Label: UILabel
```

## Inheritance

`UILabel`

## Initializers

### `init(_:)`

``` swift
public init(_ text: String)
```

### `init(_:)`

``` swift
public init(_ attributedText: AttributedString)
```

## Methods

### `number(ofLines:)`

``` swift
@discardableResult public func number(ofLines lines: Int) -> Self
```

### `font(_:)`

``` swift
@discardableResult public func font(_ font: UIFont) -> Self
```

### `font(_:)`

``` swift
@discardableResult public func font(_ textStyle: UIFont.TextStyle) -> Self
```

### `hideIfBlank()`

``` swift
@discardableResult public func hideIfBlank() -> Self
```

### `apply(attributes:)`

``` swift
@discardableResult public func apply(attributes: StringAttributes) -> Self
```

### `apply(attributes:range:)`

``` swift
@discardableResult public func apply(attributes: StringAttributes, range: ClosedRange<Int>) -> Self
```

### `text(alignment:)`

``` swift
@discardableResult public func text(alignment: NSTextAlignment) -> Self
```

### `text(color:)`

``` swift
@discardableResult public func text(color: UIColor) -> Self
```

### `title1(_:)`

``` swift
class func title1(_ text: String) -> Label
```

### `title2(_:)`

``` swift
class func title2(_ text: String) -> Label
```

### `title3(_:)`

``` swift
class func title3(_ text: String) -> Label
```

### `headline(_:)`

``` swift
class func headline(_ text: String) -> Label
```

### `subheadline(_:)`

``` swift
class func subheadline(_ text: String) -> Label
```

### `body(_:)`

``` swift
class func body(_ text: String) -> Label
```

### `callout(_:)`

``` swift
class func callout(_ text: String) -> Label
```

### `caption1(_:)`

``` swift
class func caption1(_ text: String) -> Label
```

### `caption2(_:)`

``` swift
class func caption2(_ text: String) -> Label
```
