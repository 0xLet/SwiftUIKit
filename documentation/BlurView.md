# BlurView

A UIVisualEffectView that embeds a view

``` swift
@available(iOS 10.0, *) public class BlurView: UIVisualEffectView
```

## Inheritance

`UIVisualEffectView`

## Initializers

### `init(style:closure:)`

Creates a UIVisualEffectView

``` swift
public init(style blur: UIBlurEffect.Style = UIBlurEffect.Style.regular, closure: () -> UIView)
```

#### Parameters

  - style: UIBlurEffect.Style (Default: .regular)
  - closure: View to embed into the contentView
