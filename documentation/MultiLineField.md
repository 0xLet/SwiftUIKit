# MultiLineField

``` swift
@available(iOS 9.0, *) public class MultiLineField: UITextView
```

## Inheritance

`UITextView`, `UITextViewDelegate`

## Nested Type Aliases

### `WillValueChangeHandler`

``` swift
public typealias WillValueChangeHandler = (_ sender: UITextView, _ newValue: String, _ input: String) -> Bool
```

### `DidValueChangeHandler`

``` swift
public typealias DidValueChangeHandler = (String) -> Void
```

## Initializers

### `init(value:keyboardType:)`

``` swift
public init(value: String, keyboardType type: UIKeyboardType)
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

### `textView(_:shouldChangeTextIn:replacementText:)`

``` swift
public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
```

### `textViewDidChange(_:)`

``` swift
public func textViewDidChange(_ textView: UITextView)
```
