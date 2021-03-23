# Slider

A UISlider that handles its change event

``` swift
@available(iOS 9.0, *) public class Slider: UISlider
```

## Inheritance

`UISlider`

## Initializers

### `init(value:from:to:valueChangedHandler:)`

Creates a UISlider

``` swift
public init(value: Float, from: Float, to: Float, valueChangedHandler: ((Float) -> Void)? = nil)
```

#### Parameters

  - value: Initial value of the slider
  - from: Minimum value of the slider
  - to: Maximum value of the slider
  - valueChangedHandler: Closure for the the slider's change event (Default: nil)
