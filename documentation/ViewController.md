# ViewController

A UIViewController which embeds the closure's view after the viewDidLoad

``` swift
@available(iOS 9.0, *) public class ViewController: UIViewController
```

## Inheritance

`UIViewController`

## Initializers

### `init(_:)`

Creates a UIViewController which only runs the closure after the viewDidLoad

``` swift
public init(_ closure: @escaping (() -> UIView))
```

## Methods

### `viewDidLoad()`

``` swift
public override func viewDidLoad()
```
