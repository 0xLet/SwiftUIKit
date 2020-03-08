//
//  CALayer+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Oskar on 08/03/2020.
//

import UIKit

@available(iOS 9.0, *)
public extension UIView {
  /// Change layer's content's gravity.
  /// - Parameter gravity: Will be used as layer's gravity.
  @discardableResult
  func layer(contentsGravity: CALayerContentsGravity) -> Self {
    layer.contentsGravity = contentsGravity
    
    return self
  }
  
  /// Change layer's corner radius.
  /// - Parameter radius: value, defines corner radius.
  @discardableResult
  func layer(cornerRadius: Float) -> Self {
    layer.cornerRadius = CGFloat(cornerRadius)
    
    return self
  }
  
  /// Change layer's border color.
  /// - Parameter color: use `UIColor.colorName.cgColor` to pass UIColor value.
  @discardableResult
  func layer(borderColor: CGColor) -> Self {
    layer.borderColor = borderColor
    
    return self
  }
  
  /// Change layer's border width.
  /// - Parameter width: Will be used as width value.
  @discardableResult
  func layer(borderWidth: CGFloat) -> Self {
    layer.borderWidth = borderWidth
    return self
  }
  
  /// Change layer's opacity
  /// - Parameter value: Will be used as opacity value.
  @discardableResult
  func layer(opacity: Double) -> Self {
    layer.opacity = Float(opacity)
    
    return self
  }
  
  
  /// Change layer's isHidden value
  /// - Parameter state: By default it's set to `true`
  @discardableResult
  func layer(isHidden: Bool = true) -> Self {
    layer.isHidden = isHidden
    
    return self
  }
  
  /// Set masks to bounds value.
  /// - Parameter state: By default it's set to `true`
  @discardableResult
  func layer(masksToBounds: Bool = true) -> Self {
    layer.masksToBounds = masksToBounds
    
    return self
  }
  
  /// Set layer's mask.
  /// - Parameter layer: Allows to set existing type or create new one inside closure.
  @discardableResult
  func layer(mask: @autoclosure () -> CALayer?) -> Self {
    self.layer.mask = mask()
    
    return self
  }
  
  
  /// Set `double sided` parameter.
  /// - Parameter state: By default it's set to true.
  @discardableResult
  func layer(isDoubleSided: Bool = true) -> Self {
    layer.isDoubleSided = isDoubleSided
    
    return self
  }
  
  /// Set masked corners value.
  /// - Parameter corners: You can pass exisiting value or create it inside closure
  @available(iOS 11.0, *)
  @discardableResult
  func layer(maskedCorners: @autoclosure () -> CACornerMask) -> Self {
    layer.maskedCorners = maskedCorners()
    
    return self
  }
  
  /// Set layer's shadow opacity.
  /// - Parameter opacity:
  @discardableResult
  func layer(shadowOpacity: Double) -> Self {
    layer.shadowOpacity = Float(shadowOpacity)
    
    return self
  }
  
  /// Change layer's shadow color.
  /// - Parameter color: Pass `UIColor.colorName.cgColor` to pass UIColor value
  @discardableResult
  func layer(shadowColor: CGColor) -> Self {
    layer.shadowColor = shadowColor
    
    return self
  }
  
  /// Set layer's shadow radius. Takes `Double` and converts it to `CGFloat` for programmer's convenience
  /// - Parameter radius:
  @discardableResult
  func layer(shadowRadius: Double) -> Self {
    layer.shadowRadius = CGFloat(shadowRadius)
    
    return self
  }
  
  /// Changes layer's shadowOffset to given in parameter
  /// - Parameter offset: offset value, can be calculated using closure inside or just add ready one.
  @discardableResult
  func layer(shadowOffset: @autoclosure () -> CGSize) -> Self {
    layer.shadowOffset = shadowOffset()
    
    return self
  }
  
  
  /// Set shadow path by passing existing object or use curly braces to create own one.
  /// - Parameter path:
  @discardableResult
  func layer(shadowPath: @autoclosure () -> CGPath?) -> Self {
    layer.shadowPath = shadowPath()
    
    return self
  }
  
  
  /// Set layer's `allowsEdgeAntialiasing`.
  /// - Parameter state: By default it's set to `true`
  @discardableResult
  func layer(allowsEdgeAntialiasing: Bool = true) -> Self {
    layer.allowsEdgeAntialiasing = allowsEdgeAntialiasing
    
    return self
  }
  
  
  /// Set layer's `allowsGroupOpacity`.
  /// - Parameter state: By default it's set to true
  @discardableResult
  func layer(allowsGroupOpacity: Bool = true) -> Self {
    layer.allowsGroupOpacity = allowsGroupOpacity
    
    return self
  }
  
  /// Set layer's style.
  /// - Parameter style: You can pass exisiting value or create new one inside closure.
  @discardableResult
  func layer(style: @autoclosure () -> [AnyHashable: Any]?) -> Self {
    layer.style = style()
    
    return self
  }
  
  /// Set layer's filters.
  /// - Parameter filters: You can pass exisiting value or create new one inside closure.
  @discardableResult
  func layer(filters: @autoclosure () -> [Any]?) -> Self {
    layer.filters = filters()
    
    return self
  }
  
  /// Set layer's `isOpaque` Boolean.
  /// - Parameter state: By default it's set to `true`.
  @discardableResult
  func layer(isOpaque: Bool = true) -> Self {
    layer.isOpaque = isOpaque
    
    return self
  }
  
  /// Set layer's `drawsAsynchronously`
  /// - Parameter state: By default it's set to `true`
  @discardableResult
  func layer(drawsAsynchronously: Bool = true) -> Self {
    layer.drawsAsynchronously = drawsAsynchronously
    
    return self
  }
  
  
  /// Add animation to a layer.
  /// - Parameters:
  ///   - key: Key which allows to identify given animation.
  ///   - animation: You can pass existing value or create it inside closure.
  @discardableResult
  func layer(addAnimation animation: CAAnimation, forKey key: String?) -> Self {
    layer.add(animation, forKey: key)
    
    return self
  }
  
  /// Remove layer's animation specified by given key.
  /// - Parameter key: Key that's assigned to animation.
  @discardableResult
  func layer(removeAnimationForKey key: String) -> Self {
    layer.removeAnimation(forKey: key)
    
    return self
  }
  
  /// Remove all existing layer's animations.
  @discardableResult
  func removeAllAnimationsFromLayer() -> Self {
    layer.removeAllAnimations()
    
    return self
  }
  
  
  /// Modify the object's layer
  /// - Parameters:
  ///     - closure: A trailing closure that receives itself.layer inside the closue
  @discardableResult
  func layer(_ closure: (CALayer) -> Void) -> Self {
    closure(layer)
    
    return self
  }
}
