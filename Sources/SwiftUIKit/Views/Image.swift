//
//  Image.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

/**
 A UIImageView that can show colors
 */
public class Image: UIImageView {
    /// Creates a UIImageView with a UIImage from a UIImage
    public init(_ image: UIImage) {
        super.init(image: image)
    }
    
    /// Creates a UIImageView with a UIImage from a UIColor
    public init(color: UIColor) {
        super.init(frame: .zero)
        
        self.image = Image.image(fromColor: color)
    }
    
    /// Creates a UIImageView with a UIImage from a named asset
    public init(named name: String) {
        super.init(frame: .zero)
        
        guard let image = UIImage(named: name) else {
            log(level: .error("Image \(#function) Error! Issue loading Image with name: \(name). (Could not locate Image)", nil))
            update(color: .red)
            return
        }
        
        self.image = image
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Sets the contentMode of the UIImageView
    @discardableResult
    public func contentMode(_ mode: UIView.ContentMode) -> Self {
        self.contentMode = mode
        
        return self
    }
    
    private func update(image: UIImage) {
        DispatchQueue.main.async { [weak self] in
            self?.image = image
        }
    }
    
    private func update(color: UIColor) {
        DispatchQueue.main.async { [weak self] in
            self?.image = Image.image(fromColor: color)
        }
    }
    
    private static func image(fromColor color: UIColor) -> UIImage? {
        let frame = CGRect(origin: .zero,
                           size: CGSize(width: 1, height: 1))
        
        UIGraphicsBeginImageContext(frame.size)
        
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(frame)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
}

