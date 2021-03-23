# EffectView

A UIVisualEffectView that embeds a view

``` swift
@available(iOS 9.0, *) public class EffectView: UIVisualEffectView
```

## Inheritance

`UIVisualEffectView`

## Initializers

### `init(for:closure:)`

Creates a UIVisualEffectView

``` swift
public init(for effect: UIVisualEffect? = nil, closure: () -> UIView)
```

#### Parameters

  - for: UIVisualEffect (Default: nil)
  - closure: View to embed into the contentView
