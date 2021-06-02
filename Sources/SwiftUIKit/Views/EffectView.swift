//
//  EffectView.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 1/29/20.
//

import UIKit

/**
 A UIVisualEffectView that embeds a view
 */
public class EffectView: UIVisualEffectView {
    /// Creates a UIVisualEffectView
    /// - parameters:
    ///     - for: UIVisualEffect (Default: nil)
    ///     - content: View to embed into the contentView
    public init(
        for effect: UIVisualEffect? = nil,
        content: () -> UIView
    ) {
        super.init(effect: effect)
        
        contentView.embed {
            content()
        }
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/**
 A UIVisualEffectView that embeds a view
 */
public class BlurView: UIVisualEffectView {
    /// Creates a UIVisualEffectView
    /// - parameters:
    ///     - style: UIBlurEffect.Style (Default: .regular)
    ///     - content: View to embed into the contentView
    public init(
        style blur: UIBlurEffect.Style = UIBlurEffect.Style.regular,
        content: () -> UIView
    ) {
        super.init(effect: UIBlurEffect(style: blur))
        
        contentView.embed {
            content()
        }
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/**
 A UIVisualEffectView that embeds a view
 */
@available(iOS 13.0, *)
public class VibrancyView: UIVisualEffectView {
    /// Creates a UIVisualEffectView
    /// - parameters:
    ///     - blurStyle: UIBlurEffect.Style (Default: .regular)
    ///     - vibrancyStyle: UIVibrancyEffectStyle (Default: .fill)
    ///     - content: View to embed into the contentView
    public init(
        blurStyle blur: UIBlurEffect.Style = UIBlurEffect.Style.regular,
        vibrancyStyle vibrancy: UIVibrancyEffectStyle = .fill,
        content: () -> UIView
    ) {
        super.init(effect: UIVibrancyEffect(blurEffect: UIBlurEffect(style: blur),
                                            style: vibrancy))
        
        contentView.embed {
            content()
        }
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
