# List

``` swift
@available(iOS 9.0, *) public class List: UITableView
```

## Inheritance

`UITableView`, `UITableViewDataSource`, `UITableViewDelegate`

## Initializers

### `init(defaultCellHeight:estimatedCellHeight:_:)`

``` swift
public init(defaultCellHeight: Float? = nil, estimatedCellHeight: Float? = nil, _ closure: () -> [UIView])
```

## Methods

### `didSelectHandler(_:)`

``` swift
@discardableResult func didSelectHandler(_ action: @escaping (UIView) -> Void) -> Self
```

### `configureCell(_:)`

``` swift
@discardableResult func configureCell(_ action: @escaping (UITableViewCell) -> Void) -> Self
```

### `numberOfSections(in:)`

``` swift
public func numberOfSections(in tableView: UITableView) -> Int
```

### `tableView(_:numberOfRowsInSection:)`

``` swift
public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
```

### `tableView(_:cellForRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

### `tableView(_:heightForRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
```

### `tableView(_:estimatedHeightForRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
```

### `tableView(_:didSelectRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```
