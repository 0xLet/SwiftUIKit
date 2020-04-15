//
//  EffectView.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 1/29/20.
//

import UIKit

public class EffectView: UIVisualEffectView {
    public init(for effect: UIVisualEffect? = nil, closure: () -> UIView) {
        super.init(effect: effect)
        
        contentView.embed {
            closure()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 10.0, *)
public class BlurView: UIVisualEffectView {
    public init(style blur: UIBlurEffect.Style = UIBlurEffect.Style.regular, closure: () -> UIView) {
        super.init(effect: UIBlurEffect(style: blur))
        
        contentView.embed {
            closure()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 13.0, *)
public class VibrancyView: UIVisualEffectView {
    public init(blurStyle blur: UIBlurEffect.Style = UIBlurEffect.Style.regular,
                vibrancyStyle vibrancy: UIVibrancyEffectStyle = .fill,
                closure: () -> UIView) {
        super.init(effect: UIVibrancyEffect(blurEffect: UIBlurEffect(style: blur),
                                            style: vibrancy))
        
        contentView.embed {
            closure()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
