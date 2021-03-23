# VibrancyView

A UIVisualEffectView that embeds a view

``` swift
@available(iOS 13.0, *) public class VibrancyView: UIVisualEffectView
```

## Inheritance

`UIVisualEffectView`

## Initializers

### `init(blurStyle:vibrancyStyle:closure:)`

Creates a UIVisualEffectView

``` swift
public init(blurStyle blur: UIBlurEffect.Style = UIBlurEffect.Style.regular, vibrancyStyle vibrancy: UIVibrancyEffectStyle = .fill, closure: () -> UIView)
```

#### Parameters

  - blurStyle: UIBlurEffect.Style (Default: .regular)
  - vibrancyStyle: UIVibrancyEffectStyle (Default: .fill)
  - closure: View to embed into the contentView
