# ObservedView

``` swift
@available(iOS 9.0, *) public class ObservedView<View, Value>: UIView where View: UIView
```

## Inheritance

`UIView`

## Initializers

### `init(view:initialValue:onChangeHandler:)`

``` swift
public init(view: View, initialValue: Value?, onChangeHandler: @escaping (_ newValue: Value?, _ view: View) -> Void)
```

## Methods

### `update(value:)`

``` swift
@discardableResult public func update(value: Value) -> Variable
```
