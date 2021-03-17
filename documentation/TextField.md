# TextField

``` swift
@available(iOS 9.0, *) public class TextField: UITextField
```

## Inheritance

`UITextField`, `UITextFieldDelegate`

## Nested Type Aliases

### `WillValueChangeHandler`

``` swift
public typealias WillValueChangeHandler = (_ sender: UITextField, _ newValue: String, _ input: String) -> Bool
```

### `DidValueChangeHandler`

``` swift
public typealias DidValueChangeHandler = (String) -> Void
```

## Initializers

### `init(value:placeholder:keyboardType:)`

``` swift
public init(value: String, placeholder: String, keyboardType type: UIKeyboardType)
```

## Methods

### `willInputUpdateHandler(_:)`

``` swift
@discardableResult public func willInputUpdateHandler(_ willInputUpdateHandler: @escaping WillValueChangeHandler) -> Self
```

### `inputHandler(_:)`

``` swift
@discardableResult public func inputHandler(_ inputHandler: @escaping DidValueChangeHandler) -> Self
```

### `textField(_:shouldChangeCharactersIn:replacementString:)`

``` swift
public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
```
