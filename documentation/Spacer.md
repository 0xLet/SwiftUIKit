# Spacer

A UIView that expands unless a height or width is provided

``` swift
@available(iOS 9.0, *) public class Spacer: UIView
```

## Inheritance

`UIView`

## Initializers

### `init(height:width:)`

Creates a UIView

``` swift
public init(height: Float? = nil, width: Float? = nil)
```

#### Parameters

  - height: Height for the Spacer, if nil the height will grow as much as possible (Default: nil)
  - width: Width for the Spacer, if nil the width will grow as much as possible (Default: nil)
