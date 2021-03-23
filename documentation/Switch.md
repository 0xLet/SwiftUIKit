# Switch

A UISwitch that handles its change event

``` swift
@available(iOS 9.0, *) public class Switch: UISwitch
```

## Inheritance

`UISwitch`

## Initializers

### `init(isOn:toggleChanged:)`

Creates a UISwitch

``` swift
public init(isOn: Bool = false, toggleChanged: ((Bool) -> Void)? = nil)
```

#### Parameters

  - isOn: Initial value of the switch (Default: false)
  - toggleChanged: Closure for the the switch's change event (Default: nil)
